import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_akun_controller.dart';

class TambahAkunView extends GetView<TambahAkunController> {
  const TambahAkunView({super.key});
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
                  'Tambah Akun',
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
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Nama Akun'),
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama akun tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // tipe
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: const Text('Tipe Akun'),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: const Color(0x00000000),
                          highlightColor: const Color(0x00000000),
                          onTap: () => controller.ubahTipeAkun(true),
                          child: ListTile(
                            leading: Icon(
                              controller.isDigital.value
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                            ),
                            title: const Text('Digital'),
                          ),
                        ),
                      ),

                      Expanded(
                        child: InkWell(
                          splashColor: const Color(0x00000000),
                          highlightColor: const Color(0x00000000),
                          onTap: () => controller.ubahTipeAkun(false),
                          child: ListTile(
                            leading: Icon(
                              controller.isDigital.value
                                  ? Icons.radio_button_off
                                  : Icons.radio_button_checked,
                            ),
                            title: const Text('Digital'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Saldo
                TextFormField(
                  controller: controller.saldoCtl,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixText: 'Rp. ',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // labelText: 'Nama Akun',
                    label: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Saldo'),
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Saldo akun tidak boleh kosong';
                    }
                  },
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
                    onPressed: () => controller.tambahAkun(),
                    child: const Text('Tambah Akun'),
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
