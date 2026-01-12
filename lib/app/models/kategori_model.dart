import 'package:hive/hive.dart';

part 'kategori_model.g.dart';

@HiveType(typeId: 2)
class KategoriModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nama;

  @HiveField(2)
  bool pemasukan;

  @HiveField(3)
  DateTime? tanggal;

  @HiveField(4)
  bool isActive;

  KategoriModel({
    required this.id,
    required this.nama,
    required this.pemasukan,
    this.tanggal,
    required this.isActive,
  });
}
