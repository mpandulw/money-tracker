import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';
import 'package:money_management_flutter_app/app/modules/akun/controllers/akun_controller.dart';
import 'package:money_management_flutter_app/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:money_management_flutter_app/app/modules/riwayat/controllers/riwayat_controller.dart';

class HomeController extends GetxController {
  final currentPageIndex = 0.obs; // bottom navigation index variable
  final isOpen = false.obs; // floating action button variable
  late Box<TransaksiModel> transaksiBox; // tabel / box transaksi

  final Set<int> expandedIndexes = {}; // custom trailing expansion icon

  final isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => AkunController());
    Get.lazyPut(() => RiwayatController());
    Get.lazyPut(() => KategoriController());

    transaksiBox = Hive.box<TransaksiModel>('transaksi');
    print(transaksiBox.length);
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

  int totalTransaksi(TransaksiModel transaksi) {
    return transaksi.items.fold(0, (sum, item) => sum + item.harga);
  }

  void modeToggle() {
    isEdit.value = !isEdit.value;
  }

  void hapusTransaksi(String id) {
    transaksiBox.delete(id);
    Get.back();
    Get.snackbar(
      'Sukses',
      'Berhasil menghapus transaksi',
      backgroundColor: Colors.blue,
      colorText: const Color(0xFFFFFFFF),
    );
  }
}
