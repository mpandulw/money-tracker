import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_flutter_app/app/modules/home/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Get.toNamed('/pengaturan'),
      //       icon: const Icon(
      //         Icons.settings_rounded,
      //         color: Color.fromRGBO(15, 76, 117, 1),
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              // Card akun
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      // spreadRadius: 10,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(50, 130, 184, 1),
                      Color.fromRGBO(0, 82, 162, 1),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "data",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    const Text("data"),
                    const Text("data"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
