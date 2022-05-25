import 'package:intl/intl.dart';

extension DateFormatExtensions on DateFormat {
  DateTime? tryParse(String inputString) {
    try {
      return parse(inputString);
    } on FormatException {
      return null;
    }
  }
}

class DateTimeUtil {
  // 상수 모음
  static const int dayInSeconds = 60*60*24;

  /** 현재 DateTime과 주어진 DateTime 사이의 간격이 주어진 초 이내인지 아닌지를 리턴하는 함수. */
  static bool isDateTimeLessThanSeconds(String dateTime, int seconds) {
    return DateTime.now().difference(DateTime.parse(dateTime)).inSeconds.abs() < seconds;
  }

  /** 두 DateTime 사이의 차이를 seconds 단위로 계산해서 리턴하는 함수. */
  static int gapInSecondsBetweenTwoDateTimes(String dateTime1, String dateTime2) {
    return DateTime.parse(dateTime1).difference(DateTime.parse(dateTime2)).inSeconds.abs();
  }

  /** 생일 String을 받아서 성인인지 아닌지 여부를 리턴하는 함수. */
  // birth : yyyy-MM-dd 형태.
  // 만 19세 생일 지난 나이이면 true.
  static bool calculateIsAdult(String birth) {
    final now = DateTime.now();
    final birthDateTime = DateTime.parse(birth);

    // 만 19세 초과인 경우 : 성년.
    if(now.year - birthDateTime.year > 19) {
      return true;
    }
    // 만 19세 미만인 경우 : 미성년.
    else if(now.year - birthDateTime.year < 19) {
      return false;
    }
    // 만 19세인 경우 : 생일까지 따짐.
    // 년도를 동일하게 두고, 월/일만 다르게 해서 UNIX 시간 기준으로 크기를 비교한다.
    else {
      final nowDate = DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
      // 중요 : now.year 틀린 거 아님. (연도를 같게 하고 month, day를 다르게 해서 비교하기 위함)
      final birthDate = DateTime(now.year, birthDateTime.month, birthDateTime.day).millisecondsSinceEpoch;

      if(nowDate < birthDate) {
        return false;
      } else {
        return true;
      }
    }
  }

  /** 현재 이후의 날짜인지 아닌지를 리턴하는 함수. */
  static bool isAfterNow(String dateTime1) {
    return DateTime.parse(dateTime1).isAfter(DateTime.now());
  }
}