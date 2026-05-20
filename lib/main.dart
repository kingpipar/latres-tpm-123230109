import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/app_pages.dart';
import 'models/spell.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(SpellAdapter());
  await Hive.openBox<Spell>('favorite_spells');

  NotificationService.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLogged = prefs.getBool('isLogged') ?? false;

  runApp(MyApp(isLogged: isLogged));
}

class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: isLogged ? '/characters' : AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

