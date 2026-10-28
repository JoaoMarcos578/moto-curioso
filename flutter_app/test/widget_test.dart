import 'package:flutter_test/flutter_test.dart';
import 'package:moto_curioso/main.dart';

void main() {
  testWidgets('App inicia sem erros', (WidgetTester tester) async {
    await tester.pumpWidget(const MotoCuriosoApp());
    expect(find.text('Moto'), findsOneWidget);
    expect(find.text('Curioso'), findsOneWidget);
  });
}
