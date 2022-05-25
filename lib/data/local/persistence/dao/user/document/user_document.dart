import 'package:hive/hive.dart';

part 'user_document.g.dart';

/// 다음 field number : 12
@HiveType(typeId: 1, adapterName: 'UserAdapter')
class UserDocument extends HiveObject {
  @HiveField(0, defaultValue: '')
  String jwtToken;

  @HiveField(1, defaultValue: '')
  final String userName;

  @HiveField(2, defaultValue: '')
  final String userPhone;

  @HiveField(3, defaultValue: '')
  final String userEmail;

  @HiveField(4, defaultValue: '')
  String userNickname;

  @HiveField(5)
  String? bankName;

  @HiveField(6)
  String? bankCode;

  @HiveField(7)
  String? bankAccountNumber;

  @HiveField(8)
  String? userIdNumber;

  UserDocument({
    required this.jwtToken,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.userNickname,
    this.bankName,
    this.bankCode,
    this.bankAccountNumber,
    this.userIdNumber,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserDocument &&
          runtimeType == other.runtimeType &&
          jwtToken == other.jwtToken &&
          userName == other.userName &&
          userPhone == other.userPhone &&
          userEmail == other.userEmail &&
          userNickname == other.userNickname &&
          bankName == other.bankName &&
          bankCode == other.bankCode &&
          bankAccountNumber == other.bankAccountNumber &&
          userIdNumber == other.userIdNumber;

  @override
  int get hashCode =>
      userName.hashCode ^
      jwtToken.hashCode ^
      userPhone.hashCode ^
      userEmail.hashCode ^
      userNickname.hashCode ^
      bankName.hashCode ^
      bankCode.hashCode ^
      bankAccountNumber.hashCode ^
      userIdNumber.hashCode;
}