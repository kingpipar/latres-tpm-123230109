import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controllers.dart';

class LoginPage extends GetView<LoginController> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Harry Potter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => TextField(
              controller: passController,
              obscureText: controller.isObscure.value,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(controller.isObscure.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            )),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => controller.login(userController.text, passController.text),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
