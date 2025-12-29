import 'package:get/get.dart';

import '../controllers/edit_kategori_controller.dart';

class EditKategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKategoriController>(
      () => EditKategoriController(),
    );
  }
}
