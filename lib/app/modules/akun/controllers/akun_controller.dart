import 'package:get/get.dart';

class AkunController extends GetxController {
  final akun = <Map<String, dynamic>>[].obs;

  // dummy data
  final dummy = [
    {'nama': 'BRI', 'digital': true, 'saldo': 1000},
    {'nama': 'BNI', 'digital': true, 'saldo': 1000},
    {'nama': 'BCA', 'digital': true, 'saldo': 1000},
    {'nama': 'Dompet', 'digital': false, 'saldo': 1000},
    {'nama': 'Tabungan Darurat', 'digital': false, 'saldo': 1000},
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    akun.assignAll(dummy);
  }
}
