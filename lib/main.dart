import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';
import 'package:money_management_flutter_app/app/theme/app_theme.dart';
import 'package:path_provider/path_provider.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(AkunModelAdapter());

  await Hive.openBox<AkunModel>('akun');

  // Theme
  final ThemeController themeController = Get.put(ThemeController());

  runApp(
    Obx(
      () => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    ),
  );
}
