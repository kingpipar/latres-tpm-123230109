import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/spell.dart';
import '../services/spell_services.dart';

class SpellController extends GetxController {
  var spells = <Spell>[].obs;
  var isLoading = true.obs;
  late Box<Spell> favBox;
  StreamSubscription? _favSub;
  // reactive set of favorite spell
  var favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    favBox = Hive.box<Spell>('favorite_spells');
    // initialize reactive favorites from Hive keys
    try {
      favoriteIds.clear();
      favoriteIds.addAll(favBox.keys.map((k) => k as int));
    } catch (_) {
      favoriteIds.clear();
    }
    // listen to Hive box events 
    _favSub = favBox.watch().listen((event) {
      try {
        final key = event.key as int?;
        if (key == null) return;
        if (event.deleted == true) {
          favoriteIds.remove(key);
        } else {
          favoriteIds.add(key);
        }
      } catch (_) {}
    });

    fetchSpells();
  }

  void fetchSpells() async {
    try {
      isLoading(true);
      var sps = await SpellServices.fetchSpells();
      if (sps.isNotEmpty) {
        spells.value = sps;
      }
    } finally {
      isLoading(false);
    }
  }

  bool isFavorite(Spell spell) {
    if (spell.index == null) return false;
    return favoriteIds.contains(spell.index);
  }

  void toggleFavorite(Spell spell) {
    final idx = spell.index;
    if (idx == null) return;

    if (favoriteIds.contains(idx)) {
      favBox.delete(idx);
      favoriteIds.remove(idx);
      Get.snackbar('Favorite Removed', '${spell.spell} removed from favorites', backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      favBox.put(idx, spell);
      favoriteIds.add(idx);
      Get.snackbar('Favorite Added', '${spell.spell} added to favorites', backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  @override
  void onClose() {
    _favSub?.cancel();
    super.onClose();
  }
}
