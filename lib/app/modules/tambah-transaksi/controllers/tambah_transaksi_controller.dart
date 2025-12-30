import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TambahTransaksiController extends GetxController {
  late Box<KategoriModel> kategoriBox; // kategori table variabel

  // From variable
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isPemasukan = true.obs;
  final kategoriSlct = Rxn<KategoriModel>();

  final tanggal = DateFormat(
    'yyyy-MM-dd',
  ).format(DateTime.now()); // date time buat tanggal transaksi

  final isLoading = false.obs; // loading variable

  @override
  void onInit() {
    super.onInit();
    kategoriBox = Hive.box<KategoriModel>('kategori');
  }

  void ubahTipeTransaksi(bool pemasukan) {
    if (isPemasukan.value != pemasukan) {
      isPemasukan.value = pemasukan;

      kategoriSlct.value = null;
    }
  }

  void tambahTransaksi() {
    if (formKey.currentState!.validate()) {
      // Proses tambah transaksi
    }
  }

  List<KategoriModel> getKategoriList() {
    return kategoriBox.values
        .where((kategori) => kategori.pemasukan == isPemasukan.value)
        .toList();
  }
}
