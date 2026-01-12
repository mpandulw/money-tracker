// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransaksiModelAdapter extends TypeAdapter<TransaksiModel> {
  @override
  final int typeId = 3;

  @override
  TransaksiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransaksiModel(
      id: fields[0] as String,
      nama: fields[1] as String,
      pemasukan: fields[2] as bool,
      idKategori: fields[3] as String?,
      kategoriNamaSnapshot: fields[4] as String?,
      items: (fields[5] as List).cast<ItemTransaksiModel>(),
      tanggal: fields[6] as DateTime?,
      idAkun: fields[7] as String,
      akunNamaSnapshot: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransaksiModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.pemasukan)
      ..writeByte(3)
      ..write(obj.idKategori)
      ..writeByte(4)
      ..write(obj.kategoriNamaSnapshot)
      ..writeByte(5)
      ..write(obj.items)
      ..writeByte(6)
      ..write(obj.tanggal)
      ..writeByte(7)
      ..write(obj.idAkun)
      ..writeByte(8)
      ..write(obj.akunNamaSnapshot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransaksiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
