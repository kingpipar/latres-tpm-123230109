import 'package:get/get.dart';
import '../models/char.dart';
import '../services/char_services.dart';

class CharController extends GetxController {
  var characters = <Character>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      var chars = await CharServices.fetchCharacters();
      if (chars.isNotEmpty) {
        characters.value = chars;
      }
    } finally {
      isLoading(false);
    }
  }
}
