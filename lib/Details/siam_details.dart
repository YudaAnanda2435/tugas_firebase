import 'package:flutter/material.dart';

class SiamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siam Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing Siam.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
