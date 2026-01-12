// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_transaksi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemTransaksiModelAdapter extends TypeAdapter<ItemTransaksiModel> {
  @override
  final int typeId = 4;

  @override
  ItemTransaksiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemTransaksiModel(
      nama: fields[0] as String,
      harga: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ItemTransaksiModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.harga);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemTransaksiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
