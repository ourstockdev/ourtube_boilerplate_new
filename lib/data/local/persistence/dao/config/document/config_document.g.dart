// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_document.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigAdapter extends TypeAdapter<ConfigDocument> {
  @override
  final int typeId = 0;

  @override
  ConfigDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigDocument()
      ..shouldShowOnBoardingScreen = fields[0] as bool
      ..shouldShowSignInScreen = fields[1] as bool
      ..useBioAuth = fields[2] as bool
      ..isCertifiedUser = fields[3] as bool
      ..currentUserKey = fields[4] as int?
      ..jwtToken = fields[5] as String?
      ..secondPassword = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, ConfigDocument obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.shouldShowOnBoardingScreen)
      ..writeByte(1)
      ..write(obj.shouldShowSignInScreen)
      ..writeByte(2)
      ..write(obj.useBioAuth)
      ..writeByte(3)
      ..write(obj.isCertifiedUser)
      ..writeByte(4)
      ..write(obj.currentUserKey)
      ..writeByte(5)
      ..write(obj.jwtToken)
      ..writeByte(6)
      ..write(obj.secondPassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
