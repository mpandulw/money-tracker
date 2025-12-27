import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';
import 'package:uuid/uuid.dart';

class TambahAkunController extends GetxController {
  // form variabel
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isDigital = true.obs;
  final saldoCtl = TextEditingController();

  final isLoading = false.obs; // loading if fetch data

  // insert akun
  Future<void> tambahAkun() async {
    if (formKey.currentState!.validate()) {
      try {
        final saldoCnvrt = int.tryParse(saldoCtl.text);
        final id = Uuid().v4();

        final box = Hive.box<AkunModel>('akun');
        box.put(
          id,
          AkunModel(
            id: id,
            nama: namaCtl.text,
            digital: isDigital.value,
            saldo: saldoCnvrt!,
          ),
        );

        Get.back();

        Get.snackbar(
          'Berhasil Menambahkan Akun',
          'Yatta',
          backgroundColor: Colors.blue,
        );
      } catch (e) {
        Get.snackbar(
          'Gagal Menambahkan Akun',
          'Error : $e',
          backgroundColor: Colors.red,
        );
      }
    }
  }

  // radio button function
  void ubahTipeAkun(bool tipe) {
    if (tipe != isDigital.value) {
      isDigital.value = tipe;
    }
  }
}
