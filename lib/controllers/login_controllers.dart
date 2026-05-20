import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login(String username, String password) async {
    // Hardcoded logic
    if (username == 'fare' && password == '109') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
      
      Get.snackbar('Success', 'Login Berhasil', backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed('/characters');
    } else {
      Get.snackbar('Error', 'Username atau Password salah', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogged');
    Get.offAllNamed('/login');
    Get.snackbar('Logout', 'Anda berhasil logout', backgroundColor: Colors.red, colorText: Colors.white);
  }
}
