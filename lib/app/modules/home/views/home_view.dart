import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(82, 109, 130, 1),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/pengaturan'),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),

      body: const Center(
        child: Text('HomeView is working', style: TextStyle(fontSize: 20)),
      ),
      floatingActionButton: IconButton(
        onPressed: () => Get.toNamed('/tambah-transaksi'),
        icon: const Icon(
          Icons.add_rounded,
          // color: Color(0xFFDDE6ED)
        ),
        style: ButtonStyle(
          // backgroundColor: WidgetStatePropertyAll(
          //   Color.fromRGBO(157, 178, 191, 1),
          // ),
        ),
      ),
    );
  }
}
