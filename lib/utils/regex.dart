import 'package:get/get.dart';
import 'package:intl/intl.dart';

/* 1. Email : @와 . 기호 양 옆에 숫자나 영어 1자 이상씩이며, Email 전체 길이 최대 50자
 * 2. Password : 영문+숫자+특수문자 혼용, Password 전체 길이 6~50자
 * 3. 이름 : 전체 길이 2~20자
 * 4. 별명: 전체 길이 2~20자
 * 5. 전화번호 : 전체 길이 9자-16자 (-는 저장하지 않고 카운팅도 하지 않음, 숫자로만 구성되어있으나 0으로 시작할 수 있음)
 * 6. 인증번호 : 6자 (숫자로만 구성되어있으나 0으로 시작할 수 있음)
 * 7. 계좌번호 : 최소 7자리 (숫자로만 구성)
 * 8. 추천인 코드 : 6자리 ASCII 문자열로 구성.
 */

class Regex {
  /* Email : 서버와 완전히 똑같은 Regex 적용 */
  static bool isEmail(String email) =>
    GetUtils.hasMatch(email, r'^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$');

  /* 비밀번호 입력 여부 Validation */
  static bool isPasswordLogin(String value) =>
      value.replaceAll(' ', '').isNotEmpty;

  /* Password : 영문+숫자+특수문자 혼용, Password 전체 길이 6~50자 */
  static bool isPassword(String value) =>
      GetUtils.hasMatch(value, r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{6,50}$');

  /* 이름 : 전체 길이 2~20자 */
  static bool isName(String value) =>
      GetUtils.hasMatch(value, r'^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,20}$');

  /* 별명: 전체 길이 2~10자 */
  static bool isNickname(String value) =>
      GetUtils.isLengthBetween(value, 2, 10);

  /* 생일 입력 Validation (6자리) */
  static bool isBirth(String value) =>
      GetUtils.hasMatch(value, r'^[0-9][0-9][0-1][0-9][0-3][0-9]$');

  /* 성별 Validation */
  static bool isGender(String value) =>
      value == '1' || value == '2' || value == '3' || value == '4';

  /* 전화번호 : 전체 길이 9자-16자 (-는 저장하지 않고 카운팅도 하지 않음, 숫자로만 구성되어있으나 0으로 시작할 수 있음) */
  static bool isPhone(String value) =>
      GetUtils.isPhoneNumber(value) && GetUtils.isLengthBetween(value, 9, 16);

  /* 인증번호 : 6자 (숫자로만 구성되어있으나 0으로 시작할 수 있음) */
  static bool isCode(String value) =>
      GetUtils.isNumericOnly(value) && value.length == 6;

  /* 계좌번호 : 최소 7자리 (숫자로만 구성) */
  static bool isAccount(String value) =>
      GetUtils.isNumericOnly(value) &&
      GetUtils.isLengthGreaterOrEqual(value, 7);

  /* 추천인 코드 : 6자리 ASCII 문자열로 구성. */
  static bool isRecommenderCode(String value) =>
    GetUtils.hasMatch(value, r'^[\x00-\x7F]{6}+$');

  /* 아래부터는 변환 함수.
   * 1. String getSubscriberNumber(int num) : 구독자 수를 숫자로 받아서, 만 명 단위로 표시하는 함수
   * 2. String getFormattingNumber(int num) : 숫자를 받아서, 3자리 단위로 콤마를 붙임.
   * 3. String getPercentNumber(double num) : 퍼센트 단위 숫자에 +/- 부호를 붙임.
   * 4. String secondsToDateFormat(int num) : 초를 받아서, "d일 hh:mm:ss" 형식으로 변환함.
   * 5. String dateToyyyyMdHm(String date) : "2021-08-23 16:21:41" => "2021년 8월 23일 16시 21분"과 같이 변환함.
   * 6. String dateToMdHHmm(String date) : "2021-08-09 16:49:35" => "7월 9일 20시 00분"과 같이 변환함.
   * 7. String getDateDifferenceFromNow(String date) : "2021-08-09 16:49:35" => 현재 날짜랑 비교해서 "x일 전"과 같은 형태로 만듬.
   * 8. String getFormattedDuration(String duration) : 유튜브 영상 길이(duration, 예시: "PT11M25S")값을 "11:25"과 같은 형태로 바꿈.
   * 9. String getPhoneNumberWithOnlyNumber(String phoneNumber) : 포맷팅되어 있는 phoneNumber를 받아서, 숫자만 남김.
   * 10. int getIntFromFormattingNumber(String number) : 2번 형태로 포맷팅된 숫자 문자열을 받아서 int 형태로 반환.
   */

  /* 구독자 수를 만명 단위로 표시함. */
  static String getSubscriberNumber(int num) =>
      (num ~/ 10000).toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  /* 숫자에 3자리 단위로 콤마를 붙임. */
  static String getFormattingNumber(int num) => num.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  /* 숫자에 3자리 단위로 콤마를 붙이고, +/- 부호를 붙임. */
  static String getFormattingNumberWithSign(int num) {
    if(num > 0) {
      return '+ ${getFormattingNumber(num)}';
    } else if(num < 0) {
      return getFormattingNumber(num);
    } else {
      return '0';
    }
  }

  /* 퍼센트 단위 숫자에 적절한 부호를 붙임. */
  static String getPercentNumber(double num) {
    if (num < 0) {
      return '$num%';
    } else if (num > 0) {
      return '+$num%';
    } else {
      return '0.0%';
    }
  }

  /* 초를 받아서, "d일 hh:mm:ss" 형식으로 변환함. */
  static String secondsToDateFormat(int num) {
    int days = num~/86400;
    int hours = (num - (days*86400))~/3600;
    int minutes = (num - (days*86400) - (hours*3600))~/60;
    int seconds = num - (days*86400) - (hours*3600) - (minutes*60);

    if (days >= 1) {
      return '$days일 ${hours.toString().padLeft(2,'0')}:${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
    } else {
      return '${hours.toString().padLeft(2,'0')}:${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
    }
  }

  /* "2021-08-23 16:21:41" => "2021년 8월 23일 16시 21분"과 같이 변환함. */
  static String dateToyyyyMdHm(String date) => DateFormat('yyyy년 M월 d일 H시 m분').format(DateTime.parse(date));

  static String dateToMdHHmm(String date) => DateFormat('M월 d일 HH시 mm분').format(DateTime.parse(date));

  /* "2021-08-09 16:49:35" => 현재 날짜랑 비교해서 "x일 전"과 같은 형태로 만듬. */

  /// 참고 : x달 전 부분의 경우, 완벽하게 구현한 상태가 아님. 좀 더 조사가 필요함.
  static String getDateDifferenceFromNow(String date) {
    int diffSeconds = DateTime.now().difference(DateTime.parse(date)).inSeconds;

    if (diffSeconds < 60) {
      return '$diffSeconds초 전';
    } else if (diffSeconds < 3600) {
      return '${diffSeconds ~/ 60}분 전';
    } else if (diffSeconds < 86400) {
      return '${diffSeconds ~/ 3600}시간 전';
    } else if (diffSeconds < 2592000) {
      return '${diffSeconds ~/ 86400}일 전';
    } else if (diffSeconds < 31536000) {
      return '${diffSeconds ~/ 2592000}달 전';
    } else {
      return '${diffSeconds ~/ 31536000}년 전';
    }
  }

  /* 유튜브 영상 길이(duration, 예시: "PT10H41M6S")값을 "10:41:06"과 같은 형태로 바꿈. */
  static String getFormattedDuration(String duration) {
    //10 41 6
    String tmp = duration.substring(2).replaceAll('H', ':').replaceAll('M', ':').replaceAll('S', '');
    List<String> tmpList = tmp.split(':');

    String result = '';
    for(var item in tmpList) {
      if(item.length < 2) {
        result += '0';
        result += item;
      } else {
        result += item;
      }
      result += ':';
    }
    // 초만 있다면 00분 표시를 앞에 붙임.
    if(tmpList.length == 1) {
      result = '00:$result';
    }

    return result.substring(0, result.length-1);
  }

  /* 포맷팅되어 있는 phoneNumber를 받아서, 숫자만 남김. */
  static String getPhoneNumberWithOnlyNumber(String phoneNumber) {
    return phoneNumber.replaceAll('-', '');
  }

  /* 2번 형태로 포맷팅된 숫자 문자열을 받아서 int 형태로 반환. */
  static int getIntFromFormattingNumber(String number) {
    return (number == '') ? 0 : int.parse(number.replaceAll(',', ''));
  }
}
