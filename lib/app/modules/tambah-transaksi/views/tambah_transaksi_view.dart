import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class TambahTransaksiView extends GetView<TambahTransaksiController> {
  const TambahTransaksiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahTransaksiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TambahTransaksiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
