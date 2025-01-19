import 'package:flutter/material.dart';

class AnggoraDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anggora Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing Anggora.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
