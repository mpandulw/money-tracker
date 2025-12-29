import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';
import 'package:uuid/uuid.dart';

class TambahKategoriController extends GetxController {
  // Form variabel
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isPemasukan = true.obs;

  final isLoading = false.obs; // loading variabel

  void ubahTipeKategori(bool pemasukan) {
    if (isPemasukan.value != pemasukan) {
      isPemasukan.value = pemasukan;
    }
  }

  void tambahKategori() async {
    if (formKey.currentState!.validate()) {
      final id = Uuid().v4();
      final box = Hive.box<KategoriModel>('kategori');
      box.put(
        id,
        KategoriModel(
          id: id,
          nama: namaCtl.text,
          pemasukan: isPemasukan.value,
          tanggal: DateTime.now(),
        ),
      );
    }
  }
}
