Moto Curioso

Aplicativo Android que identifica modelos de motos **Royal Enfield** a partir de uma foto, usando reconhecimento de imagem com Inteligência Artificial.

Projeto desenvolvido como **Trabalho de Conclusão de Curso** em Engenharia de Computação na Universidade de Ribeirão Preto (UNAERP), 2026.

## Como funciona

1. O usuário abre a câmera pelo app e fotografa a moto.
2. A imagem é enviada para um workflow hospedado no **Roboflow**, que roda o modelo de detecção treinado.
3. O app escolhe a classe com maior confiança (mínimo de 50%) e mostra a ficha da moto: categoria, cilindrada, potência, torque e uma curiosidade histórica.

## Modelos reconhecidos

Bear 650 · Classic 350 · Continental GT · Guerrilla 450 · Himalayan · Hunter 350 · Interceptor 650 · Meteor 350 · Shotgun 650 · Super Meteor 650

## Tecnologias

| Parte | Tecnologias |
|-------|-------------|
| App mobile | Flutter (Dart), `camera`, `image_picker`, `http`, `permission_handler` |
| Modelo de IA | Python, Ultralytics YOLO11, PyTorch |
| Dataset e inferência | Roboflow (dataset anotado e workflow serverless) |

## Estrutura

```
├── flutter_app/
│   └── lib/
│       ├── main.dart
│       ├── data/motorcycle_data.dart      ← fichas técnicas das motos
│       ├── screens/                       ← telas inicial, câmera e resultado
│       └── services/roboflow_service.dart ← chamada à API do Roboflow
└── train_model.py                         ← treinamento do modelo YOLO11
```

## Rodando o app

Pré-requisitos: [Flutter](https://docs.flutter.dev/get-started/install) e um celular Android ou emulador.

```bash
cd flutter_app
flutter pub get
flutter run --dart-define=ROBOFLOW_API_KEY=sua_chave
```

A chave da API do Roboflow não fica no código. Ela é informada no momento do build com `--dart-define`.

## Treinando o modelo

```bash
pip install ultralytics torch
python train_model.py
```

O script espera o dataset exportado do Roboflow (formato YOLOv11) em `dataset/data.yaml` e os pesos pré-treinados `yolo11x.pt` da Ultralytics na raiz. Ele treina por até 100 épocas, valida (mAP50 e mAP50-95) e exporta o modelo para ONNX.

## Autor

**João Marcos Castelli**, Engenheiro de Computação
