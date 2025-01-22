import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'titipan_saya.dart'; // Import halaman TitipanSayaPage
import '../db/database_helper.dart';

class DataPenitipanPage extends StatefulWidget {
  const DataPenitipanPage({Key? key}) : super(key: key);

  @override
  _DataPenitipanPageState createState() => _DataPenitipanPageState();
}

class _DataPenitipanPageState extends State<DataPenitipanPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hpEmailController = TextEditingController();
  final _jumlahHariController = TextEditingController();
  final _jenisKucingController = TextEditingController();

  final CollectionReference _penitipanCollection =
      FirebaseFirestore.instance.collection('penitipan');
  final CollectionReference _titipanSuksesCollection =
      FirebaseFirestore.instance.collection('titipan_sukses');

  String? _editingId;

  @override
  void dispose() {
    _namaController.dispose();
    _hpEmailController.dispose();
    _jumlahHariController.dispose();
    _jenisKucingController.dispose();
    super.dispose();
  }

  void _addData() async {
    try {
      if (_editingId == null) {
        await _penitipanCollection.add({
          'nama': _namaController.text,
          'hpEmail': _hpEmailController.text,
          'jumlahHari': int.parse(_jumlahHariController.text),
          'jenisKucing': _jenisKucingController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil disimpan')),
        );
      } else {
        await _penitipanCollection.doc(_editingId).update({
          'nama': _namaController.text,
          'hpEmail': _hpEmailController.text,
          'jumlahHari': int.parse(_jumlahHariController.text),
          'jenisKucing': _jenisKucingController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil diupdate')),
        );
      }

      _clearForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  void _clearForm() {
    _namaController.clear();
    _hpEmailController.clear();
    _jumlahHariController.clear();
    _jenisKucingController.clear();
    _editingId = null;
  }

  void _sendDataToTitipanSukses(Map<String, dynamic> data, String docId) async {
    try {
      // Salin data ke koleksi 'titipan_sukses'
      await _titipanSuksesCollection.add(data);

      // Hapus data dari koleksi 'penitipan' setelah dipindahkan
      await _penitipanCollection.doc(docId).delete();

      // Simpan data ke SQLite
      final dbHelper = DatabaseHelper();
      await dbHelper.insertData(data);

      // Navigasi ke halaman TitipanSaya
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TitipanSayaPage(data: data),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil dipindahkan')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memindahkan data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penitipan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _hpEmailController,
                    decoration:
                        const InputDecoration(labelText: 'No. HP atau Email'),
                  ),
                  TextFormField(
                    controller: _jumlahHariController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Jumlah Hari'),
                  ),
                  TextFormField(
                    controller: _jenisKucingController,
                    decoration:
                        const InputDecoration(labelText: 'Jenis Kucing'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addData,
                    child: const Text('Simpan Data'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _penitipanCollection.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.data!.docs.where((doc) {
                    var itemData = doc.data() as Map<String, dynamic>;
                    return !itemData['nama'].toString().contains('(sukses)');
                  }).toList();

                  if (data.isEmpty) {
                    return const Center(
                        child: Text('Tidak ada data penitipan.'));
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ListTile(
                        title: Text(item['nama']),
                        subtitle: Text(
                            'Hari: ${item['jumlahHari']} | Jenis: ${item['jenisKucing']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.send, color: Colors.green),
                              onPressed: () {
                                _sendDataToTitipanSukses({
                                  'nama': item['nama'],
                                  'hpEmail': item['hpEmail'],
                                  'jumlahHari': item['jumlahHari'],
                                  'jenisKucing': item['jenisKucing'],
                                }, item.id); // Kirim id dokumen
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _namaController.text = item['nama'];
                                _hpEmailController.text = item['hpEmail'];
                                _jumlahHariController.text =
                                    item['jumlahHari'].toString();
                                _jenisKucingController.text =
                                    item['jenisKucing'];
                                setState(() {
                                  _editingId = item.id;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                await _penitipanCollection
                                    .doc(item.id)
                                    .delete();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TitipanSayaPage(data: {})),
          );
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
