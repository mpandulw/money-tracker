import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  static const String boxName = 'pengaturan';
  static const String keyTheme = 'isDarkMode';

  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void _loadTheme() async {
    final box = await Hive.openBox(boxName);
    isDarkMode.value = box.get(keyTheme, defaultValue: false);
  }

  void toggleMode() {
    isDarkMode.value = !isDarkMode.value;
    _saveTheme();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void _saveTheme() async {
    final box = await Hive.openBox(boxName);
    box.put(keyTheme, isDarkMode.value);
  }
}
