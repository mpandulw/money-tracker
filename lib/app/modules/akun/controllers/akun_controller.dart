import 'package:get/get.dart';

class AkunController extends GetxController {
  final akun = <Map<String, dynamic>>[].obs;

  // dummy data
  final dummy = [
    {'nama': 'BRI', 'saldo': 1000},
    {'nama': 'BRI', 'saldo': 1000},
    {'nama': 'BRI', 'saldo': 1000},
    {'nama': 'BRI', 'saldo': 1000},
    {'nama': 'BRI', 'saldo': 1000},
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    akun.assignAll(dummy);
  }
}
