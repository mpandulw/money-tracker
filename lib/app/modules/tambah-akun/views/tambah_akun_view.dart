import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_akun_controller.dart';

class TambahAkunView extends GetView<TambahAkunController> {
  const TambahAkunView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahAkunView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TambahAkunView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
