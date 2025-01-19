import 'package:aplikasi_akhir/screens/login.dart';
import 'package:aplikasi_akhir/screens/signup.dart';
import 'package:flutter/material.dart';

// Gantilah dengan halaman SignUpPage dan LoginPage yang sesuai
class Started extends StatefulWidget {
  const Started({Key? key}) : super(key: key);

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              '/assets/images/banner3.png', // Ganti dengan path gambar Anda
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'leave your beloved cat\nwithout worries',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              // margin: const EdgeInsets.only(right:80),
              padding: const EdgeInsets.only(
                  left: 30, right: 100), // Padding hanya di sisi kanan
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman signup
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUp()), // Ganti dengan halaman signup.dart
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white, // Warna teks
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Sign up'),
                    ),
                    const Icon(Icons.arrow_forward, size: 30),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  right: 38, left: 100), // Padding hanya di sisi kanan
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.play_arrow_sharp, size: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Login()), // Ganti dengan halaman login.dart
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Warna tombol
                        foregroundColor: Colors.white, // Warna teks
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child:
                          const Text('Login'), // Tidak ada warna di Text
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
