// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'akun_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AkunModelAdapter extends TypeAdapter<AkunModel> {
  @override
  final int typeId = 1;

  @override
  AkunModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AkunModel(
      id: fields[0] as String,
      nama: fields[1] as String,
      digital: fields[2] as bool,
      saldo: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AkunModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.digital)
      ..writeByte(3)
      ..write(obj.saldo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AkunModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
