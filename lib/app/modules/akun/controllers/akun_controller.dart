import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';
import 'package:flutter/material.dart';

class AkunController extends GetxController {
  late Box<AkunModel> akun; // box akun
  final isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    akun = Hive.box<AkunModel>('akun');
    // akun.deleteAll(HiveList(akun));
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
  }

  void hapusAkun(String id) {
    akun.delete(id);
    Get.back();
    Get.snackbar(
      'Sukses',
      'Berhasil menghapus akun',
      backgroundColor: Colors.blue,
      colorText: const Color(0xFFFFFFFF),
    );
  }
}
