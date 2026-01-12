import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';

class KategoriController extends GetxController {
  late Box<KategoriModel> kategoriBox;

  final isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    kategoriBox = Hive.box<KategoriModel>('kategori');
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
  }

  void disableKategori(String id) {
    final kategori = kategoriBox.get(id)!;
    kategori.isActive = false;
    kategori.save();

    Get.back();
    Get.snackbar(
      'Sukses',
      'Berhasil menghapus kategori',
      backgroundColor: Colors.blue,
      colorText: const Color(0xFFFFFFFF),
    );
  }

  List<KategoriModel> get kategoriAktif {
    return kategoriBox.values.where((kategori) => kategori.isActive).toList();
  }
}
