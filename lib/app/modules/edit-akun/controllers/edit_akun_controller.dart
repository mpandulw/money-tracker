import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';

class EditAkunController extends GetxController {
  final formKey = GlobalKey<FormState>(); // Form state

  // variabel akun
  late String id;
  final namaCtl = TextEditingController();
  final isDigital = false.obs;
  final saldoCtl = TextEditingController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    id = args['id'];
    namaCtl.text = args['nama'];
    isDigital.value = args['digital'];
    saldoCtl.text = args['saldo'].toString();
  }

  // radio button function
  void ubahTipeAkun(bool tipe) {
    if (tipe != isDigital.value) {
      isDigital.value = tipe;
    }
  }

  // edit akun
  void editAkun() async {
    final box = Hive.box<AkunModel>('akun');
    box.put(
      id,
      AkunModel(
        id: id,
        nama: namaCtl.text,
        digital: isDigital.value,
        saldo: int.tryParse(saldoCtl.text)!,
      ),
    );
  }
}
