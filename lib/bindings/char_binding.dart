import 'package:get/get.dart';
import '../controllers/char_controllers.dart';

class CharBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharController>(() => CharController());
  }
}
