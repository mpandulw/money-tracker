import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/edit_akun_controller.dart';

class EditAkunView extends GetView<EditAkunController> {
  const EditAkunView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Edit Akun',
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
                      child: const Text('Nama Akun'),
                    ),
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    filled: true,
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
                            title: const Text('Tunai'),
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Saldo'),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 233, 233, 1),
                    helperText: 'Saldo hanya boleh berisi angak 0-9',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Saldo akun tidak boleh kosong';
                    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Saldo hanya boleh berisi angka 0-9';
                    }
                    return null;
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
                    onPressed: () => controller.editAkun(),
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
