import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('RiwayatView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            // Fitur filter & sorting
            SliverToBoxAdapter(
              child: Row(
                children: [
                  // Fitur filter
                  TextButton.icon(
                    icon: Icon(Icons.filter_alt),
                    label: Text('Filter'),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Filter',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(
                                      width: double.infinity,
                                      child: Divider(),
                                    ),

                                    const Text('Tipe Transaksi'),

                                    Row(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: const Text('Pemasukan'),
                                        ),
                                        const SizedBox(width: 8),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: const Text('Pengeluaran'),
                                        ),
                                      ],
                                    ),

                                    const Text('Kategori Transaksi'),

                                    Row(
                                      children: List.generate(
                                        controller.kategoriBox.length,
                                        (index) {
                                          final kategori = controller
                                              .kategoriBox
                                              .values
                                              .toList()[index];
                                          return Text(kategori.nama);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // Fitur sorting
                  TextButton.icon(
                    icon: Icon(Icons.sort),
                    label: Text('Sort'),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Center(child: Text('Fitur Sortir')),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Riwayat
            ValueListenableBuilder(
              valueListenable: controller.transaksiBox.listenable(),
              builder: (BuildContext context, Box<TransaksiModel> box, _) {
                final transaksiList = box.values.toList()
                  ..sort((a, b) => b.tanggal!.compareTo(a.tanggal!));

                if (transaksiList.isEmpty) {
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

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final transaksi = transaksiList[index];

                    return StatefulBuilder(
                      builder: (context, setState) {
                        final isExpanded = controller.expandedIndexes.contains(
                          index,
                        );

                        return Card(
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
                                Text(
                                  NumberFormat.currency(
                                    name: 'IDR',
                                    symbol: 'Rp. ',
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                  ).format(
                                    controller.totalTransaksi(transaksi),
                                  ),
                                  style: TextStyle(
                                    color: transaksi.pemasukan
                                        ? const Color(0xFF00DD00)
                                        : const Color(0xFFDD0000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(width: 8),

                                AnimatedRotation(
                                  turns: isExpanded ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 200),
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
                        );
                      },
                    );
                  }, childCount: transaksiList.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
