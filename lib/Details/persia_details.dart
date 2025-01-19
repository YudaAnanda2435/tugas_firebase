import 'package:flutter/material.dart';

class PersiaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persia Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing Persia.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
