import 'package:flutter/material.dart';

class BengalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bengal Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing bengal.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
