import 'package:get/get.dart';
import '../controllers/fav_controllers.dart';

class FavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavController>(() => FavController());
  }
}
