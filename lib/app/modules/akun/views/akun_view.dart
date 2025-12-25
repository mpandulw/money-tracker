import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  const AkunView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Akun'),
        // centerTitle: true,
        backgroundColor: const Color(0x00000000),
        actions: [
          TextButton.icon(
            onPressed: () => Get.toNamed('/tambah-akun'),
            label: const Text(
              'Tambah Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 130, 184, 1),
              ),
            ),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              side: WidgetStatePropertyAll(
                BorderSide(color: Color.fromRGBO(50, 130, 184, 1), width: 2),
              ),
            ),
            icon: Icon(Icons.add, color: Color.fromRGBO(50, 130, 184, 1)),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 8),
      ),

      body: controller.akun.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty.png',
                      height: 100,
                      width: 100,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Anda belum memiliki akun saldo, silahkan buat terlebih dahulu',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              itemCount: controller.akun.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(endIndent: 15, indent: 15);
              },
              itemBuilder: (context, index) {
                final item = controller.akun[index];

                return ListTile(
                  title: Text(item['nama']),
                  trailing: Text(
                    NumberFormat.currency(
                      symbol: 'Rp. ',
                      locale: 'ID',
                    ).format(item['saldo']).toString(),
                  ),
                );
              },
            ),
    );
  }
}
