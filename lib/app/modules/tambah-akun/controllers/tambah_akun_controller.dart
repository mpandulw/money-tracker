import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum TipeAkun { digital, tunai }

class TambahAkunController extends GetxController {
  // form variabel
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isDigital = true.obs;
  final saldoCtl = TextEditingController();
  TipeAkun tipe = TipeAkun.digital;

  final isLoading = false.obs; // loading if fetch data

  // insert akun
  Future<void> tambahAkun() async {
    if (formKey.currentState!.validate()) {
      print(namaCtl.text);
      print(isDigital.value);
      print(saldoCtl.text.removeAllWhitespace);
    }
  }

  // radio button function
  void ubahTipeAkun(bool tipe) {
    if (tipe != isDigital.value) {
      isDigital.value = tipe;
    }
  }
}
