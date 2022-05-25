import 'package:ourtube_boilerplate/utils/regex.dart';

extension NullableStringExtension on String? {
  bool get isNotEmpty => this?.isNotEmpty ?? false;

  bool get isEmail => _validateNullableString(Regex.isEmail);

  bool get isPassword => _validateNullableString(Regex.isPassword);

  bool get isPasswordLogin => _validateNullableString(Regex.isPasswordLogin);

  bool get isName => _validateNullableString(Regex.isName);

  bool get isNickname => _validateNullableString(Regex.isNickname);

  bool get isBirth => _validateNullableString(Regex.isBirth);

  bool get isGender => _validateNullableString(Regex.isGender);

  bool get isPhone => _validateNullableString(Regex.isPhone);

  bool get isCode => _validateNullableString(Regex.isCode);

  bool _validateNullableString(bool Function(String) validator) =>
      this == null ? false : validator(this!);
}
