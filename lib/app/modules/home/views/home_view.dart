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
        () => IndexedStack(
          index: controller.currentPageIndex.value,
          children: [Home(), AkunView(), RiwayatView()],
        ),
      ),

      floatingActionButton: IconButton(
        onPressed: () => Get.toNamed('/tambah-transaksi'),
        icon: const Icon(
          Icons.add_rounded,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(187, 225, 250, 1),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color.fromRGBO(50, 130, 184, 1),
          ),
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
                        : Color.fromRGBO(15, 76, 117, 1),
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
                        : Color.fromRGBO(15, 76, 117, 1),
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
                        : Color.fromRGBO(15, 76, 117, 1),
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
