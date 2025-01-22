// import 'package:flutter/material.dart';
// import '../db/database_helper.dart';
// import '../admin/admin_page.dart'; // Pastikan path ini sesuai dengan lokasi file AdminPage Anda

// class TitipanSayaPage extends StatelessWidget {
//   final Map<String, dynamic> data;

//   const TitipanSayaPage({Key? key, required this.data}) : super(key: key);

//   // Function to show the modal for admin key pass
//   void _showAdminModal(BuildContext context) {
//     final TextEditingController controller = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Masukkan Key Pass Admin'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: controller,
//                 decoration: const InputDecoration(labelText: 'Key Pass'),
//                 obscureText: true,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Check if the entered key pass is correct
//                 if (controller.text == 'yuda_admin') {
//                   // Navigate to Admin Page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const AdminPage()),
//                   );
//                 } else {
//                   // Show error message if incorrect
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Key pass salah!')),
//                   );
//                   Navigator.of(context).pop(); // Close the modal
//                 }
//               },
//               child: const Text('Masuk'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the modal
//               },
//               child: const Text('Batal'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Titipan Saya'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.admin_panel_settings),
//             onPressed: () {
//               // Show the admin key pass modal when pressed
//               _showAdminModal(context);
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: DatabaseHelper().getAllData(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final data = snapshot.data!;
//           if (data.isEmpty) {
//             return const Center(child: Text('Tidak ada data titipan.'));
//           }

//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final item = data[index];
//               return ListTile(
//                 title: Text(item['nama']),
//                 subtitle: Text(
//                     'Hari: ${item['jumlahHari']} | Jenis: ${item['jenisKucing']}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../admin/admin_page.dart'; // Pastikan path ini sesuai dengan lokasi file AdminPage Anda

class TitipanSayaPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const TitipanSayaPage({Key? key, required this.data}) : super(key: key);

  // Function to show the modal for admin key pass
  void _showAdminModal(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Masukkan Key Pass Admin'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Key Pass'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Check if the entered key pass is correct
                if (controller.text == 'yuda_admin') {
                  // Navigate to Admin Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminPage()),
                  );
                } else {
                  // Show error message if incorrect
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Key pass salah!')),
                  );
                  Navigator.of(context).pop(); // Close the modal
                }
              },
              child: const Text('Masuk'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the modal
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titipan Saya'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              // Show the admin key pass modal when pressed
              _showAdminModal(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Mengambil data dari database
        future: DatabaseHelper().getAllData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(child: Text('Tidak ada data titipan.'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                title: Text(item['nama']),
                subtitle: Text(
                    'Hari: ${item['jumlahHari']} | Jenis: ${item['jenisKucing']}'),
              );
            },
          );
        },
      ),
    );
  }
}
