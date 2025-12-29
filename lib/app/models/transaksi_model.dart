import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class TransaksiModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nama;

  @HiveField(2)
  bool pemasukan;

  @HiveField(3)
  String kategori;

  @HiveField(4)
  Map<String, dynamic> item;

  @HiveField(5)
  DateTime tanggal;

  TransaksiModel({
    required this.id,
    required this.nama,
    required this.pemasukan,
    required this.kategori,
    required this.item,
    required this.tanggal,
  });
}
