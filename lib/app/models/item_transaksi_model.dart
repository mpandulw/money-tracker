import 'package:hive/hive.dart';

part 'item_transaksi_model.g.dart';

@HiveType(typeId: 4)
class ItemTransaksiModel {
  @HiveField(0)
  String nama;

  @HiveField(1)
  int harga;

  ItemTransaksiModel({required this.nama, required this.harga});

  @override
  String toString() {
    return '{nama: $nama, harga: $harga}';
  }
}
