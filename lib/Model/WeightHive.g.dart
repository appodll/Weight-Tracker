// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeightHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeighthiveAdapter extends TypeAdapter<Weighthive> {
  @override
  final int typeId = 0;

  @override
  Weighthive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weighthive(
      id: fields[0] as int,
      height: fields[1] as String,
      weight: fields[2] as String,
      dateTime: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Weighthive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeighthiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
