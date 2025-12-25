import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_management_flutter_app/app/modules/akun/views/akun_view.dart';
import 'package:money_management_flutter_app/app/modules/home/views/home.dart';
import 'package:money_management_flutter_app/app/modules/riwayat/views/riwayat_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
      body: Obx(
        () => SafeArea(
          child: IndexedStack(
            index: controller.currentPageIndex.value,
            children: [Home(), AkunView(), RiwayatView()],
          ),
        ),
      ),

      floatingActionButton: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // scan
            AnimatedOpacity(
              opacity: controller.isOpen.value ? 1 : 0,
              duration: Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !controller.isOpen.value,
                child: IconButton(
                  iconSize: 40,
                  onPressed: () => Get.toNamed('/scan'),
                  icon: const Icon(
                    Icons.document_scanner_rounded,
                    color: Color.fromRGBO(187, 225, 250, 1),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(50, 130, 184, 1),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(12.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // tambah transaksi
            AnimatedOpacity(
              opacity: controller.isOpen.value ? 1 : 0,
              duration: Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !controller.isOpen.value,
                child: IconButton(
                  iconSize: 40,
                  onPressed: () => Get.toNamed('/tambah-transaksi'),
                  icon: const Icon(
                    Icons.note_add,
                    color: Color.fromRGBO(187, 225, 250, 1),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(50, 130, 184, 1),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(12.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Main button / close button
            IconButton(
              iconSize: 40,
              onPressed: () => controller.floatingIconButtonToggle(),
              icon: AnimatedRotation(
                turns: controller.isOpen.value ? 0.125 : 0,
                duration: Duration(milliseconds: 100),
                // transform: Matrix4.rotationZ(12),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.add_rounded,
                  // fontWeight: FontWeight.bold,
                  color: controller.isOpen.value
                      ? Color.fromRGBO(225, 0, 0, 1)
                      : Color.fromRGBO(187, 225, 250, 1),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  // controller.isOpen.value
                  //     ? Color.fromRGBO(153, 0, 0, 1)
                  // :
                  Color.fromRGBO(50, 130, 184, 1),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(
                      Radius.circular(12.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 130, 184, 1),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              blurRadius: 10,
              offset: Offset(0, -1),
              // spreadRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Halaman utama
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0,
                  controller.currentPageIndex.value == 0 ? -5 : 0,
                  0,
                ),
                child: IconButton(
                  onPressed: () => controller.changePageIndex(0),
                  icon: Icon(
                    controller.currentPageIndex.value == 0
                        ? Icons.home_rounded
                        : Icons.home_outlined,
                    color: controller.currentPageIndex.value == 0
                        ? Color.fromRGBO(187, 225, 250, 1)
                        : Color.fromRGBO(27, 38, 44, 1),
                  ),
                ),
              ),
            ),

            // Akun
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0,
                  controller.currentPageIndex.value == 1 ? -5 : 0,
                  0,
                ),
                child: IconButton(
                  onPressed: () => controller.changePageIndex(1),
                  icon: Icon(
                    controller.currentPageIndex.value == 1
                        ? Icons.account_balance_wallet_rounded
                        : Icons.account_balance_wallet_outlined,
                    color: controller.currentPageIndex.value == 1
                        ? Color.fromRGBO(187, 225, 250, 1)
                        : Color.fromRGBO(27, 38, 44, 1),
                  ),
                ),
              ),
            ),

            // Riwayat
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0,
                  controller.currentPageIndex.value == 2 ? -5 : 0,
                  0,
                ),
                child: IconButton(
                  onPressed: () => controller.changePageIndex(2),
                  icon: Icon(
                    controller.currentPageIndex.value == 2
                        ? Icons.history_rounded
                        : Icons.history_outlined,
                    color: controller.currentPageIndex.value == 2
                        ? Color.fromRGBO(187, 225, 250, 1)
                        : Color.fromRGBO(27, 38, 44, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
