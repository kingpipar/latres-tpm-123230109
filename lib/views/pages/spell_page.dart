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
          // IconButton(
          //   icon: const Icon(Icons.favorite, color: Colors.lightBlue),
          //   onPressed: () {
          //     Get.toNamed('/favorites');
          //   },
          // ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/favorites');
          },
          backgroundColor:Colors.lightBlue,
          child: const Icon(Icons.favorite, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0,),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 20,
            ),
            onPressed: () {
              Get.offNamed('/characters');
            },
            child: const Text('Characters', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
