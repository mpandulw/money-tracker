import 'package:hive/hive.dart';

part 'akun_model.g.dart';

@HiveType(typeId: 1)
class AkunModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nama;

  @HiveField(2)
  bool digital;

  @HiveField(3)
  int saldo;

  AkunModel({
    required this.id,
    required this.nama,
    required this.digital,
    required this.saldo,
  });
}
