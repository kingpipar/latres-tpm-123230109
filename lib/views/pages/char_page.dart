import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/char_controllers.dart';
import '../../controllers/login_controllers.dart';
import '../widget/char_card.dart';

class CharPage extends GetView<CharController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Retrieve LoginController and call logout
              final loginController = Get.put(LoginController());
              loginController.logout();
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.characters.isEmpty) {
          return const Center(child: Text('No characters found'));
        }
        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final char = controller.characters[index];
            return CharCard(character: char);
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 200.0, vertical: 12.0,),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 20,
            ),
            onPressed: () {
              Get.offNamed('/spells');
            },
            child: const Text('Spells', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
