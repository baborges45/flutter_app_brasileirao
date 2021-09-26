import 'package:app_brasileirao/controller/theme_controller.dart';
import 'package:app_brasileirao/pages/home_page.dart';

import 'package:app_brasileirao/repository/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());

  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent[100],
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
