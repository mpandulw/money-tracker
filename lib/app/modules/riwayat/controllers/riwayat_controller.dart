import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/kategori_model.dart';
import 'package:money_management_flutter_app/app/models/transaksi_model.dart';

class RiwayatController extends GetxController {
  late Box<TransaksiModel> transaksiBox; // table / box transaksi
  late Box<KategoriModel> kategoriBox;

  final Set<int> expandedIndexes = {}; // custom trailing expansion icon

  @override
  void onInit() {
    super.onInit();
    transaksiBox = Hive.box('transaksi');
    kategoriBox = Hive.box('kategori');
  }

  int totalTransaksi(TransaksiModel transaksi) {
    return transaksi.items.fold(0, (sum, item) => sum + item.harga);
  }
}
