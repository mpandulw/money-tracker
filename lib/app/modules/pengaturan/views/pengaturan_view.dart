import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'Dark Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Ubah tampilan tema menjadi lebih gelap',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            trailing: Obx(
              () => Switch(
                activeTrackColor: Color.fromRGBO(24, 67, 146, 1),
                activeThumbColor: Color.fromRGBO(45, 123, 190, 1),
                // inactiveThumbColor: Colors.yellow,
                thumbIcon: controller.themeController.isDarkMode.value
                    ? WidgetStatePropertyAll(
                        const Icon(
                          Icons.dark_mode_rounded,
                          color: Color.fromRGBO(12, 49, 122, 1),
                        ),
                      )
                    : WidgetStatePropertyAll(
                        Icon(Icons.light_mode_rounded, color: Colors.amber),
                      ),
                trackOutlineColor: WidgetStatePropertyAll(
                  Color.fromRGBO(24, 67, 146, 1),
                ),
                value: controller.themeController.isDarkMode.value,
                onChanged: (_) {
                  controller.themeController.toggleMode();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
