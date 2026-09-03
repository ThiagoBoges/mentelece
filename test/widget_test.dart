import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mentelece/main.dart';

void main() {
  testWidgets('App inicia na tela do diário', (WidgetTester tester) async {
    await tester.pumpWidget(const MenteLeveApp());
    expect(find.text('MenteLeve'), findsWidgets);
  });
}
