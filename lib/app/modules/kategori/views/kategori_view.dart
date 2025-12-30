import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        actions: [
          Obx(
            () => TextButton.icon(
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(135, double.minPositive),
                ),
                side: WidgetStatePropertyAll(
                  BorderSide(color: Color.fromRGBO(50, 130, 184, 1)),
                ),
              ),
              onPressed: () => controller.toggleEdit(),
              icon: Icon(
                controller.isEdit.value
                    ? Icons.edit_off_rounded
                    : Icons.edit_rounded,
                color: controller.isEdit.value
                    ? const Color(0xFFFF0000)
                    : Color.fromRGBO(50, 130, 184, 1),
              ),
              label: Text(
                controller.isEdit.value ? 'Tutup' : 'Mode Edit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.isEdit.value
                      ? const Color(0xFFFF0000)
                      : Color.fromRGBO(50, 130, 184, 1),
                ),
              ),
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 8),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                    ),
                  ),
                  onPressed: () => Get.toNamed('/tambah-kategori'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      const Text('Tambah Kategori'),
                    ],
                  ),
                ),
              ),
            ),

            ValueListenableBuilder(
              valueListenable: controller.kategori.listenable(),
              builder: (context, Box<KategoriModel> box, _) {
                if (box.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/empty.png',
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Anda belum memiliki kategori, silahkan buat terlebih dahulu',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverList.separated(
                  itemCount: box.length,
                  separatorBuilder: (_, _) =>
                      const Divider(endIndent: 15, indent: 15),
                  itemBuilder: (context, index) {
                    final item = box.getAt(index)!;

                    return ListTile(
                      title: Row(children: [Text(item.nama)]),
                      subtitle: Text(
                        item.pemasukan ? 'Pemasukan' : 'Pengeluaran',
                      ),
                      trailing: Obx(
                        () =>
                            // edit mode
                            controller.isEdit.value
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () => Get.toNamed(
                                      '/edit-kategori',
                                      arguments: {
                                        'id': item.id,
                                        'nama': item.nama,
                                        'pemasukan': item.pemasukan,
                                        // 'saldo': item.saldo,
                                      },
                                    ),
                                    icon: const Icon(Icons.edit_document),
                                  ),

                                  const SizedBox(width: 10),

                                  IconButton(
                                    onPressed: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            title: const Text('Konfirmasi'),

                                            content: const Text(
                                              'Apakah kamu yakin untuk menghapus Kategori ini?',
                                            ),

                                            actions: [
                                              TextButton(
                                                onPressed: () => Get.back(),
                                                child: const Text('Tidak'),
                                              ),

                                              FilledButton(
                                                onPressed: () => controller
                                                    .hapusKategori(item.id),
                                                child: const Text('Ya'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete_rounded,
                                      color: Color(0xFFFF0000),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
