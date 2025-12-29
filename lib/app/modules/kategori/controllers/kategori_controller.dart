import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';

class KategoriController extends GetxController {
  late Box<KategoriModel> kategori;

  final isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    kategori = Hive.box<KategoriModel>('kategori');
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
  }

  void hapusKategori(String id) {
    kategori.delete(id);
    Get.back();
  }
}
