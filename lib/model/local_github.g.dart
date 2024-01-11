// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_github.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalGithubAdapter extends TypeAdapter<LocalGithub> {
  @override
  final int typeId = 1;

  @override
  LocalGithub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalGithub(
      login: fields[0] as String?,
      avatarUrl: fields[1] as String?,
      dateTime: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalGithub obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.avatarUrl)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalGithubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
