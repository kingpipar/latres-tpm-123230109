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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: 'Spells'),
        ],
        onTap: (index) {
          if (index == 1) {
            Get.offNamed('/spells');
          }
        },
      ),
    );
  }
}
