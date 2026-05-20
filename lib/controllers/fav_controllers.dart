import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/spell.dart';
import '../services/notification_service.dart';

class FavController extends GetxController {
  late Box<Spell> favBox;

  @override
  void onInit() {
    super.onInit();
    favBox = Hive.box<Spell>('favorite_spells');
  }

  List<Spell> get favoriteSpells => favBox.values.toList();

  void removeFavorite(Spell spell) {
    favBox.delete(spell.index);
    update();
    NotificationService.showImmediateNotification(
        'Favorite Removed', '${spell.spell} has been removed from favorites');
  }
}

