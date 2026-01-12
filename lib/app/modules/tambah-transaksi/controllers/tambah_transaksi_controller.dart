import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_flutter_app/app/models/akun_model.dart';
import 'package:money_management_flutter_app/app/models/item_transaksi_form_model.dart';
import 'package:money_management_flutter_app/app/models/item_transaksi_model.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';
import 'package:uuid/uuid.dart';

class TambahTransaksiController extends GetxController {
  late Box<KategoriModel> kategoriBox; // tabel kategori
  late Box<AkunModel> akunBox; // tabel akun

  final formItem = <ItemTransaksiFormModel>[
    ItemTransaksiFormModel(),
  ].obs; // item transaksi variable

  // From variable
  final formKey = GlobalKey<FormState>();
  final namaCtl = TextEditingController();
  final isPemasukan = true.obs;
  final akunSlct = Rxn<AkunModel>();
  final kategoriSlct = Rxn<KategoriModel>();

  final tanggal = DateFormat(
    'yyyy-MM-dd',
  ).format(DateTime.now()); // date time buat tanggal transaksi

  final isLoading = false.obs; // loading variable

  @override
  void onInit() {
    super.onInit();
    kategoriBox = Hive.box<KategoriModel>('kategori');
    akunBox = Hive.box<AkunModel>('akun');
  }

  void ubahTipeTransaksi(bool pemasukan) {
    if (isPemasukan.value != pemasukan) {
      isPemasukan.value = pemasukan;

      kategoriSlct.value = null;
    }
  }

  void tambahTransaksi() {
    print('click');
    if (formKey.currentState!.validate()) {
      final id = Uuid().v4();
      final tgl = DateTime.now();

      final transaksiBox = Hive.box<TransaksiModel>('transaksi');
      transaksiBox.put(
        id,
        TransaksiModel(
          id: id,
          nama: namaCtl.text,
          pemasukan: isPemasukan.value,
          items: buildItem,
          idAkun: akunSlct.value!.id,
          akunNamaSnapshot: akunSlct.value!.nama,
          tanggal: tgl,
          idKategori: kategoriSlct.value?.id,
          kategoriNamaSnapshot: kategoriSlct.value?.nama,
        ),
      );

      Get.back();
      Get.snackbar(
        'Sukses',
        'Berhasil menambahkan transaksi',
        backgroundColor: Colors.blue,
        colorText: const Color(0xFFFFFFFF),
      );
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
}
