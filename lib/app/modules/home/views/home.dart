import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';
import 'package:money_management_flutter_app/app/modules/home/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 8),
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
              onPressed: () => controller.modeToggle(),
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
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: CustomScrollView(
          slivers: [
            ValueListenableBuilder(
              valueListenable: controller.transaksiBox.listenable(),
              builder: (context, Box<TransaksiModel> box, _) {
                if (box.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: Text('Belum ada transaksi')),
                  );
                }

                final transaksiList = box.values.toList()
                  ..sort((a, b) => b.tanggal!.compareTo(a.tanggal!));

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final transaksi = transaksiList[index];

                    return StatefulBuilder(
                      builder: (context, setState) {
                        final isExpanded = controller.expandedIndexes.contains(
                          index,
                        );

                        return Obx(
                          () => Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              shape: Border(),
                              tilePadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              childrenPadding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 12,
                              ),
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: transaksi.pemasukan
                                    ? const Color.fromARGB(25, 0, 255, 0)
                                    : const Color.fromARGB(25, 255, 0, 0),
                                child: Icon(
                                  transaksi.pemasukan
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  color: transaksi.pemasukan
                                      ? Colors.green
                                      : Colors.red,
                                  size: 18,
                                ),
                              ),
                              title: Text(
                                transaksi.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),

                                  Text(transaksi.kategoriNamaSnapshot ?? '-'),

                                  Text(
                                    transaksi.akunNamaSnapshot,
                                    style: const TextStyle(fontSize: 12),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(transaksi.tanggal!),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  controller.isEdit.value
                                      ? IconButton(
                                          onPressed: () async {
                                            await Get.toNamed(
                                              '/edit-transaksi',
                                              arguments: transaksi,
                                            );
                                            controller.isEdit.value = false;
                                          },
                                          icon: const Icon(Icons.edit_document),
                                        )
                                      : Text(
                                          NumberFormat.currency(
                                            name: 'IDR',
                                            symbol: 'Rp. ',
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                          ).format(
                                            controller.totalTransaksi(
                                              transaksi,
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: transaksi.pemasukan
                                                ? const Color(0xFF00DD00)
                                                : const Color(0xFFDD0000),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                  const SizedBox(width: 8),

                                  controller.isEdit.value
                                      ? IconButton(
                                          onPressed: () {
                                            showCupertinoDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    'Konfirmasi',
                                                  ),

                                                  content: const Text(
                                                    'Apakah kamu yakin untuk menghapus transaksi ini?',
                                                  ),

                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child: const Text(
                                                        'Tidak',
                                                      ),
                                                    ),

                                                    FilledButton(
                                                      onPressed: () =>
                                                          controller
                                                              .hapusTransaksi(
                                                                transaksi.id,
                                                              ),
                                                      child: const Text('Ya'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              0,
                                              0,
                                            ),
                                          ),
                                        )
                                      : AnimatedRotation(
                                          turns: isExpanded ? 0.5 : 0,
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                          ),
                                        ),
                                ],
                              ),

                              onExpansionChanged: (expanded) {
                                setState(() {
                                  if (expanded) {
                                    controller.expandedIndexes.add(index);
                                  } else {
                                    controller.expandedIndexes.remove(index);
                                  }
                                });
                              },

                              children: transaksi.items.map((item) {
                                return ListTile(
                                  dense: true,
                                  title: Text(item.nama),
                                  trailing: Text(
                                    NumberFormat.currency(
                                      locale: 'ID',
                                      symbol: 'Rp. ',
                                    ).format(item.harga),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    );
                  }, childCount: transaksiList.length),
                );
              },
            ),

            const SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 70)),
          ],
        ),
      ),
    );
  }
}
