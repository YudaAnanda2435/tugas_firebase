import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _fireAuth = FirebaseAuth.instance;

class AuthProvider with ChangeNotifier {
  final form = GlobalKey<FormState>();
  String enteredEmail = '';
  String enteredPassword = '';
  bool isLogin = false;

  // Fungsi untuk menyimpan email
  void setEmail(String email) {
    enteredEmail = email;
  }

  // Fungsi untuk menyimpan password
  void setPassword(String password) {
    enteredPassword = password;
  }

  Future<void> submit() async {
    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      throw 'Email dan password tidak boleh kosong'; // Tambahkan pengecekan
    }

    try {
      // Cek apakah sudah login atau sign up
      if (isLogin) {
        // Logika untuk login
        await _fireAuth.signInWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
      } else {
        // Logika untuk sign-up
        await _fireAuth.createUserWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
      }

      // Jika berhasil, set status login ke true
      isLogin = true;
      notifyListeners();
    } catch (error) {
      print('Login atau Sign Up gagal: $error');
      isLogin = false;
      notifyListeners();
      throw 'Login atau Sign Up gagal: $error'; // Menangani error dan menampilkan pesan
    }
  }
}
