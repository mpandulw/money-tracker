import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_kategori_controller.dart';

class EditKategoriView extends GetView<EditKategoriController> {
  const EditKategoriView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditKategoriView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditKategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
