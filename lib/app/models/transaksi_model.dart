import 'package:hive/hive.dart';
import 'package:money_management_flutter_app/app/models/item_transaksi_model.dart';

part 'transaksi_model.g.dart';

@HiveType(typeId: 3)
class TransaksiModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nama;

  @HiveField(2)
  bool pemasukan;

  @HiveField(3)
  String? idKategori;

  @HiveField(4)
  String? kategoriNamaSnapshot;

  @HiveField(5)
  List<ItemTransaksiModel> items;

  @HiveField(6)
  DateTime? tanggal;

  @HiveField(7)
  String idAkun;

  @HiveField(8)
  String akunNamaSnapshot;

  TransaksiModel({
    required this.id,
    required this.nama,
    required this.pemasukan,
    this.idKategori,
    this.kategoriNamaSnapshot,
    required this.items,
    this.tanggal,
    required this.idAkun,
    required this.akunNamaSnapshot,
  });

  @override
  String toString() {
    return 'id: $id, nama: $nama, pemasukan: $pemasukan, id_kategori: $idKategori, nama_kategori_snapshot: $kategoriNamaSnapshot, items: ${List.from(items)}, tanggal: $tanggal, id_akun: $idAkun, nama_akun_snapshot: $akunNamaSnapshot';
  }
}
