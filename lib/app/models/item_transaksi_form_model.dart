import 'package:flutter/material.dart';

class ItemTransaksiFormModel {
  final TextEditingController namaCtl;
  final TextEditingController hargaCtl;

  ItemTransaksiFormModel({String? nama, int? harga})
    : namaCtl = TextEditingController(text: nama ?? ''),
      hargaCtl = TextEditingController(
        text: harga != null ? harga.toString() : '',
      );
}
