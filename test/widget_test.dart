import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebasetask/main.dart'; // Thay đổi tên package phù hợp với project của bạn

void main() {
  testWidgets('CarGridView builds with grid view', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the app title is displayed
    expect(find.text('Car List App'), findsOneWidget);

    // Verify the grid view is displayed
    expect(find.byType(GridView), findsOneWidget);

    // Tap the list view icon and trigger a frame
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify the list view is displayed
    expect(find.byType(ListView), findsOneWidget);
  });
}
