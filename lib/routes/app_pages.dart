import 'package:get/get.dart';
import '../bindings/login_binding.dart';
import '../bindings/char_binding.dart';
import '../bindings/spell_binding.dart';
import '../bindings/fav_binding.dart';
import '../views/pages/login_page.dart';
import '../views/pages/char_page.dart';
import '../views/pages/char_detail.dart';
import '../views/pages/spell_page.dart';
import '../views/pages/fav_page.dart';

class AppPages {
  static const INITIAL = '/login';

  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/characters',
      page: () => CharPage(),
      binding: CharBinding(),
    ),
    GetPage(
      name: '/char_detail',
      page: () => CharDetail(),
    ),
    GetPage(
      name: '/spells',
      page: () => SpellPage(),
      binding: SpellBinding(),
    ),
    GetPage(
      name: '/favorites',
      page: () => FavPage(),
      binding: FavBinding(),
    ),
  ];
}
