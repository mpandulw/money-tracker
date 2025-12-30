import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';

class EditKategoriController extends GetxController {
  // Form variabel
  final formKey = GlobalKey<FormState>();
  late String id;
  final namaCtl = TextEditingController();
  final isPemasukan = true.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    id = args['id'];
    namaCtl.text = args['nama'];
    isPemasukan.value = args['pemasukan'];
  }

  void kategoriToggle(bool pemasukan) {
    if (isPemasukan.value != pemasukan) {
      isPemasukan.value = pemasukan;
    }
  }

  void updateKategori() {
    final box = Hive.box<KategoriModel>('kategori');
    box.put(
      id,
      KategoriModel(id: id, nama: namaCtl.text, pemasukan: isPemasukan.value),
    );
    Get.back();
  }
}
