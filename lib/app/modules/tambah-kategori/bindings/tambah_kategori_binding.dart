import 'package:get/get.dart';

import '../controllers/tambah_kategori_controller.dart';

class TambahKategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKategoriController>(
      () => TambahKategoriController(),
    );
  }
}
