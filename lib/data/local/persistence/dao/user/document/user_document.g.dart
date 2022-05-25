// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_document.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<UserDocument> {
  @override
  final int typeId = 1;

  @override
  UserDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDocument(
      jwtToken: fields[0] == null ? '' : fields[0] as String,
      userName: fields[1] == null ? '' : fields[1] as String,
      userPhone: fields[2] == null ? '' : fields[2] as String,
      userEmail: fields[3] == null ? '' : fields[3] as String,
      userNickname: fields[4] == null ? '' : fields[4] as String,
      bankName: fields[5] as String?,
      bankCode: fields[6] as String?,
      bankAccountNumber: fields[7] as String?,
      userIdNumber: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDocument obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.jwtToken)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userPhone)
      ..writeByte(3)
      ..write(obj.userEmail)
      ..writeByte(4)
      ..write(obj.userNickname)
      ..writeByte(5)
      ..write(obj.bankName)
      ..writeByte(6)
      ..write(obj.bankCode)
      ..writeByte(7)
      ..write(obj.bankAccountNumber)
      ..writeByte(8)
      ..write(obj.userIdNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
