import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/fav_controllers.dart';

class FavPage extends GetView<FavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Spells'),
      ),
      body: GetBuilder<FavController>(
        builder: (_) {
          final favSpells = controller.favoriteSpells;
          if (favSpells.isEmpty) {
            return const Center(child: Text('No favorite spells'));
          }
          return ListView.builder(
            itemCount: favSpells.length,
            itemBuilder: (context, index) {
              final spell = favSpells[index];
              return ListTile(
                title: Text(spell.spell ?? 'Unknown Spell'),
                subtitle: Text(spell.use ?? 'No description'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // hapus dari favBox dan tampilkan immediate notification
                    controller.removeFavorite(spell);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
