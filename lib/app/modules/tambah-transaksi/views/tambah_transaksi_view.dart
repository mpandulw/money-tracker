import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class TambahTransaksiView extends GetView<TambahTransaksiController> {
  const TambahTransaksiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        foregroundColor: const Color(0xFFFF0000),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          }

          return Form(
            key: controller.formKey,
            child: ListView(
              children: [
                // const SizedBox(height: 16),
                const Text(
                  'Tambah Transaksi',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 70),

                // nama akun
                TextFormField(
                  controller: controller.namaCtl,

                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // labelText: 'Nama Akun',
                    label: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Nama'),
                    ),
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    filled: true,
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama transaksi tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // tipe transaksi
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: const Text('Tipe Transaksi'),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: const Color(0x00000000),
                        highlightColor: const Color(0x00000000),
                        onTap: () => controller.ubahTipeTransaksi(true),
                        child: ListTile(
                          leading: Icon(
                            controller.isPemasukan.value
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                          ),
                          title: const Text('Pemasukan'),
                        ),
                      ),

                      InkWell(
                        splashColor: const Color(0x00000000),
                        highlightColor: const Color(0x00000000),
                        onTap: () => controller.ubahTipeTransaksi(false),
                        child: ListTile(
                          leading: Icon(
                            controller.isPemasukan.value
                                ? Icons.radio_button_off
                                : Icons.radio_button_checked,
                          ),
                          title: const Text('Pengeluaran'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Akun
                DropdownButtonFormField(
                  initialValue: controller.akunSlct.value,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // labelText: 'Nama Akun',
                    label: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Akun'),
                    ),
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    filled: true,
                  ),
                  items: List.generate(controller.akunBox.length, (index) {
                    final akun = controller.akunBox.getAt(index)!;

                    return DropdownMenuItem(
                      value: akun,
                      child: Text(akun.nama),
                    );
                  }),
                  onChanged: (value) {
                    controller.akunSlct.value = value;
                    print(controller.akunSlct.toString());
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Field ini tidak boleh kosong';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // dropdown kategori
                DropdownButtonFormField(
                  initialValue: controller.kategoriSlct.value,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // labelText: 'Nama Akun',
                    label: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Kategori'),
                    ),
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    filled: true,
                  ),
                  items: controller.getKategoriList().map((kategori) {
                    return DropdownMenuItem(
                      value: kategori,
                      child: Text(kategori.nama),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.kategoriSlct.value = value;
                  },
                ),

                const SizedBox(height: 30),

                // item transaksi
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: const Text('Item Transaksi'),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    spacing: 16,
                    children: [
                      Table(
                        columnWidths: {},
                        children: [
                          TableRow(
                            children: [const Text('Nama'), const Text('Harga')],
                          ),
                        ],
                      ),

                      ...List.generate(controller.item.length, (index) {
                        final item = controller.item[index];

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: item.namaCtl,
                                decoration: InputDecoration(
                                  hintText: 'Nama barang',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Nama item tidak boleh kosong!';
                                  }

                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: TextFormField(
                                controller: item.hargaCtl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(hintText: 'Rp. '),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harga barang tidak boleh kosong';
                                  }

                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(width: 8),

                            InkWell(
                              onTap: () => controller.hapusItem(index),
                              child: Icon(
                                Icons.delete,
                                color: Color(0xFFDD0000),
                              ),
                            ),
                          ],
                        );
                      }),

                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () => controller.tambahItem(),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),

                // item transaksi (struk belanja model iseng)
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Container(
                //     // height: 200,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey,
                //           blurRadius: 10,
                //           spreadRadius: 1,
                //           // offset: Offset(5, 5),
                //         ),
                //       ],
                //       image: DecorationImage(
                //         image: AssetImage('assets/images/paper-texture.jpg'),
                //         repeat: ImageRepeat.repeat,
                //       ),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           LayoutBuilder(
                //             builder: (context, constraints) {
                //               final charWidth = 8.0;
                //               final count = (constraints.maxWidth / charWidth)
                //                   .floor();

                //               return Text(
                //                 '=' * count,
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //                 maxLines: 1,
                //               );
                //             },
                //           ),

                //           const SizedBox(height: 8),

                //           const Text(
                //             'Receipt',
                //             style: TextStyle(
                //               fontFamily: 'asciid',
                //               fontSize: 30,
                //             ),
                //           ),

                //           const SizedBox(height: 8),

                //           // LayoutBuilder(
                //           //   builder: (context, constraints) {
                //           //     final charWidth = 8.0;
                //           //     final count = (constraints.maxWidth / charWidth)
                //           //         .floor();

                //           //     return Text(
                //           //       '=' * count,
                //           //       style: const TextStyle(
                //           //         fontFamily: 'monospace',
                //           //         fontSize: 14,
                //           //       ),
                //           //       maxLines: 1,
                //           //     );
                //           //   },
                //           // ),
                //           const SizedBox(height: 8),

                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text(
                //                 'Tipe',
                //                 style: TextStyle(fontFamily: 'monospace'),
                //               ),

                //               Text(
                //                 controller.isPemasukan.value
                //                     ? 'Pemasukan'
                //                     : 'Pengeluaran',
                //                 style: TextStyle(fontFamily: 'monospace'),
                //               ),
                //             ],
                //           ),

                //           const SizedBox(height: 8),

                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text(
                //                 'Tanggal',
                //                 style: TextStyle(fontFamily: 'monospace'),
                //               ),

                //               Text(
                //                 controller.tanggal,
                //                 style: TextStyle(fontFamily: 'monospace'),
                //               ),
                //             ],
                //           ),

                //           const SizedBox(height: 8),

                //           LayoutBuilder(
                //             builder: (context, constraints) {
                //               final charWidth = 8.0;
                //               final count = (constraints.maxWidth / charWidth)
                //                   .floor();

                //               return Text(
                //                 '=' * count,
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //                 maxLines: 1,
                //               );
                //             },
                //           ),

                //           LayoutBuilder(
                //             builder: (context, constraints) {
                //               final charWidth = 8.0;
                //               final count = (constraints.maxWidth / charWidth)
                //                   .floor();

                //               return Text(
                //                 '=' * count,
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //                 maxLines: 1,
                //               );
                //             },
                //           ),

                //           const SizedBox(height: 8),

                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text(
                //                 'Total',
                //                 style: TextStyle(
                //                   fontFamily: 'monospace',
                //                   // fontSize: 14,
                //                 ),
                //               ),

                //               Text(
                //                 'Rp. ',
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //               ),
                //             ],
                //           ),

                //           const SizedBox(height: 8),

                //           LayoutBuilder(
                //             builder: (context, constraints) {
                //               final charWidth = 8.0;
                //               final count = (constraints.maxWidth / charWidth)
                //                   .floor();

                //               return Text(
                //                 '=' * count,
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //                 maxLines: 1,
                //               );
                //             },
                //           ),

                //           const SizedBox(height: 8),

                //           const Text(
                //             'Terimakasih',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               fontFamily: 'monospace',
                //               fontSize: 16,
                //             ),
                //           ),

                //           const SizedBox(height: 8),

                //           LayoutBuilder(
                //             builder: (context, constraints) {
                //               final charWidth = 8.0;
                //               final count = (constraints.maxWidth / charWidth)
                //                   .floor();

                //               return Text(
                //                 '=' * count,
                //                 style: const TextStyle(
                //                   fontFamily: 'monospace',
                //                   fontSize: 14,
                //                 ),
                //                 maxLines: 1,
                //               );
                //             },
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 100),

                // submit button
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () => controller.tambahTransaksi(),
                    child: const Text('Tambah Transaksi'),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
