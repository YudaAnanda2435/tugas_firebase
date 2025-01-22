// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'admin_page_test.mocks.dart';

// import '../lib/admin/admin_page.dart';
// import 'package:aplikasi_akhir/db/database_helper.dart';

// @GenerateMocks([DatabaseHelper])
// void main() {
//   group('AdminPage Widget Tests', () {
//     testWidgets('should call deleteData when delete button is pressed',
//         (WidgetTester tester) async {
//       // Arrange
//       final mockDbHelper = MockDatabaseHelper();

//       when(mockDbHelper.getAllData()).thenAnswer((_) async => [
//             {
//               'id': 1,
//               'nama': 'Test Item',
//               'jumlahHari': 3,
//               'jenisKucing': 'Persia'
//             },
//           ]);
//       when(mockDbHelper.deleteData(1)).thenAnswer((_) async => 1);

//       // Inject mock into AdminPage widget
//       await tester.pumpWidget(MaterialApp(
//         home: AdminPage(dbHelper: mockDbHelper), // pastikan dbHelper di-inject
//       ));
//       await tester.pump(); // Wait for FutureBuilder to rebuild.

//       // Act
//       await tester.tap(find.byIcon(Icons.delete));
//       await tester.pumpAndSettle(); // Wait for UI to settle.

//       // Assert
//       verify(mockDbHelper.deleteData(1)).called(1);
//       expect(find.text('Data berhasil dihapus'), findsOneWidget);
//     });
//   });
// }
