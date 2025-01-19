import 'package:flutter/material.dart';

class SphynxDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pxhy Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing Sphy.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
