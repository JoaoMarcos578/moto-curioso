import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecognitionResult {
  final String className;
  final double confidence;

  const RecognitionResult({
    required this.className,
    required this.confidence,
  });
}

class RoboflowService {
  // Informada no build: flutter run --dart-define=ROBOFLOW_API_KEY=sua_chave
  static const String _apiKey = String.fromEnvironment('ROBOFLOW_API_KEY');
  static const String _workspace = 'joos-workspace-2qopm';
  static const String _workflowId = 'motocurioso';

  static const double _minConfidence = 0.50;

  // Correções de nomes de classes do modelo
  static const Map<String, String> _classNameFixes = {
    'shotgun 450': 'shotgun650',
    'continental gt': 'continentalgt',
    'guerrilla 450': 'guerrilla450',
    'bear 650': 'bear650',
    'interceptor 650': 'interceptor650',
    'meteor 350': 'meteor350',
    'super meteor': 'supermeteor650',
  };

  static Future<RecognitionResult?> predict(File imageFile) async {
    if (_apiKey.isEmpty) {
      throw Exception(
        'Chave da API Roboflow não configurada. Rode o app com '
        '--dart-define=ROBOFLOW_API_KEY=sua_chave',
      );
    }

    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final uri = Uri.parse(
      'https://serverless.roboflow.com/$_workspace/workflows/$_workflowId',
    );

    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'api_key': _apiKey,
            'inputs': {
              'image': {'type': 'base64', 'value': base64Image},
            },
          }),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception(
        'Erro na API Roboflow (${response.statusCode}): ${response.body}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    // Estrutura: outputs[0]["predictions"]["predictions"]
    final outputs = json['outputs'] as List<dynamic>?;
    if (outputs == null || outputs.isEmpty) return null;

    final output = outputs.first as Map<String, dynamic>;
    final predictionsWrapper = output['predictions'] as Map<String, dynamic>?;
    if (predictionsWrapper == null) return null;

    final predictions = predictionsWrapper['predictions'] as List<dynamic>?;
    if (predictions == null || predictions.isEmpty) return null;

    // Quando o modelo retorna múltiplas classes, escolhe a de maior confidence
    Map<String, dynamic>? best;
    double bestConf = 0;

    for (final pred in predictions) {
      final conf = (pred['confidence'] as num).toDouble();
      if (conf > bestConf) {
        bestConf = conf;
        best = pred as Map<String, dynamic>;
      }
    }

    // Rejeita se nenhuma classe atingir o limiar mínimo de confiança
    if (best == null || bestConf < _minConfidence) return null;

    final rawClass = (best['class'] as String).toLowerCase();
    final className = _classNameFixes[rawClass] ?? rawClass;

    return RecognitionResult(
      className: className,
      confidence: bestConf,
    );
  }
}
