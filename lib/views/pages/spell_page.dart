import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/spell_controller.dart';
import '../../controllers/login_controllers.dart';

class SpellPage extends GetView<SpellController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spells'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed('/favorites');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
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
        if (controller.spells.isEmpty) {
          return const Center(child: Text('No spells found'));
        }
        return ListView.builder(
          itemCount: controller.spells.length,
          itemBuilder: (context, index) {
            final spell = controller.spells[index];
            // final isFav = controller.isFavorite(spell);
            return ListTile(
              title: Text(spell.spell ?? 'Unknown Spell'),
              subtitle: Text(spell.use ?? 'No description'),
              trailing: Obx(() {
                final isFav = controller.favoriteIds.contains(spell.index);
                return IconButton(
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : null),
                  onPressed: () => controller.toggleFavorite(spell),
                );
              }),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: 'Spells'),
        ],
        onTap: (index) {
          if (index == 0) {
            Get.offNamed('/characters');
          }
        },
      ),
    );
  }
}
