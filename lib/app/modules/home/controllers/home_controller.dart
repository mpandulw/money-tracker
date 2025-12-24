import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentPageIndex = 0.obs; // bottom navigation index variable
  final isOpen = false.obs; // floating action button variable

  @override
  void onInit() {
    super.onInit();
  }

  void changePageIndex(int i) {
    currentPageIndex.value = i;
  }

  void floatingIconButtonToggle() {
    isOpen.value = !isOpen.value;
  }
}
