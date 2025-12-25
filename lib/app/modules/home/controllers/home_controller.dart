import 'package:get/get.dart';
import 'package:money_management_flutter_app/app/modules/akun/controllers/akun_controller.dart';
import 'package:money_management_flutter_app/app/modules/riwayat/controllers/riwayat_controller.dart';

class HomeController extends GetxController {
  final currentPageIndex = 0.obs; // bottom navigation index variable
  final isOpen = false.obs; // floating action button variable

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => AkunController());
    Get.lazyPut(() => RiwayatController());
  }

  void changePageIndex(int i) {
    currentPageIndex.value = i;
    switch (currentPageIndex.value) {
      case 1:
        Get.put(AkunController());
        break;

      case 2:
        Get.put(RiwayatController());
        break;
      default:
    }
  }

  void floatingIconButtonToggle() {
    isOpen.value = !isOpen.value;
  }
}
