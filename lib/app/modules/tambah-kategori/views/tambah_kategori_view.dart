import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_kategori_controller.dart';

class TambahKategoriView extends GetView<TambahKategoriController> {
  const TambahKategoriView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Color(0xFF000000))),
        backgroundColor: Color(0x00000000),
        foregroundColor: const Color(0xFFFF0000),
        centerTitle: true,
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
                  'Tambah Kategori',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 70),

                // nama kategori
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
                      child: const Text('Nama Kategori'),
                    ),
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    filled: true,
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama kategori tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // tipe
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: const Text('Tipe Kategori'),
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
                        onTap: () => controller.ubahTipeKategori(true),
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
                        onTap: () => controller.ubahTipeKategori(false),
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
                    onPressed: () => controller.tambahKategori(),
                    child: const Text('Tambah Kategori'),
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
