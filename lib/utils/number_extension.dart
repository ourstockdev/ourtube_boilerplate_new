import 'package:intl/intl.dart';

final _cashFormat = NumberFormat('###,###,###,###,###');

extension NumberExtension on num {
  String toCashFormat() {
    return _cashFormat.format(this);
  }
}
