import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';
import 'package:money_management_flutter_app/app/models/item_transaksi_form_model.dart';
import 'package:money_management_flutter_app/app/models/item_transaksi_model.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';

class EditTransaksiController extends GetxController {
  late TransaksiModel transaksi; // variabel objek transaksi
  late Box<KategoriModel> kategoriBox; // tabel kategori
  late Box<AkunModel> akunBox; // tabel akun
  late Box<TransaksiModel> transaksiBox; // tabel transaksi

  final formItem = <ItemTransaksiFormModel>[
    // ItemTransaksiFormModel(),
  ].obs; // item transaksi variable

  // From variable
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isPemasukan = true.obs;
  late Rxn<AkunModel> akunSlct = Rxn<AkunModel>();
  final Rxn<KategoriModel> kategoriSlct = Rxn<KategoriModel>();

  @override
  void onInit() {
    super.onInit();
    transaksi = Get.arguments;

    kategoriBox = Hive.box<KategoriModel>('kategori');
    akunBox = Hive.box<AkunModel>('akun');
    transaksiBox = Hive.box<TransaksiModel>('transaksi');

    // Initialize form data
    namaCtl.text = transaksi.nama;
    isPemasukan.value = transaksi.pemasukan;
    akunSlct.value = akunBox.get(transaksi.idAkun);

    if (transaksi.idKategori != null) {
      kategoriSlct.value = kategoriBox.get(transaksi.idKategori);
    }

    for (var item in transaksi.items) {
      formItem.add(ItemTransaksiFormModel(nama: item.nama, harga: item.harga));
    }
  }

  void ubahTipeTransaksi(bool pemasukan) {
    if (isPemasukan.value != pemasukan) {
      isPemasukan.value = pemasukan;

      kategoriSlct.value = null;
    }
  }

  void tambahItem() {
    formItem.add(ItemTransaksiFormModel());
  }

  void hapusItem(int index) {
    if (formItem.length > 1) {
      formItem.removeAt(index);
    }
  }

  List<KategoriModel> getKategoriList() {
    return kategoriBox.values
        .where(
          (kategori) =>
              kategori.pemasukan == isPemasukan.value && kategori.isActive,
        )
        .toList();
  }

  List<AkunModel> get getListAktifAkun {
    return akunBox.values.where((akun) => akun.isActive).toList();
  }

  List<ItemTransaksiModel> get buildItem {
    return formItem.map((formItem) {
      return ItemTransaksiModel(
        nama: formItem.namaCtl.text,
        harga: int.tryParse(formItem.hargaCtl.text)!,
      );
    }).toList();
  }

  void editTransaksi() {
    if (formKey.currentState!.validate()) {
      try {
        transaksiBox.put(
          transaksi.id,
          TransaksiModel(
            id: transaksi.id,
            nama: namaCtl.text,
            pemasukan: isPemasukan.value,
            items: buildItem,
            idAkun: akunSlct.value!.id,
            akunNamaSnapshot: akunSlct.value!.nama,
            tanggal: transaksi.tanggal,
            idKategori: kategoriSlct.value?.id,
            kategoriNamaSnapshot: kategoriSlct.value?.nama,
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      Get.back();
      Get.snackbar(
        'Berhasil',
        'Transaksi berhasil diubah',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }
}
