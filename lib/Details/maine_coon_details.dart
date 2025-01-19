import 'package:flutter/material.dart';

class MaineCoonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maine Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Informasi lengkap tentang kucing Coon.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
