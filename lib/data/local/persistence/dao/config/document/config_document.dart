import 'package:hive_flutter/adapters.dart';

part 'config_document.g.dart';

@HiveType(typeId: 0, adapterName: 'ConfigAdapter')
class ConfigDocument extends HiveObject {
  // 온보딩 페이지를 보여줘야 하는지 여부
  @HiveField(0)
  bool shouldShowOnBoardingScreen = true;

  // 로그인 페이지를 보여줘야 하는지 여부
  @HiveField(1)
  bool shouldShowSignInScreen = true;

  // 생체인증 이용 여부
  @HiveField(2)
  bool useBioAuth = false;

  // 인증된 유저인지의 여부(비회원 or 회원)
  @HiveField(3)
  bool isCertifiedUser = false;

  // 현재 유저의 키값
  @HiveField(4)
  int? currentUserKey;

  // 현재 유저의 토큰값
  @HiveField(5)
  String? jwtToken;

  // 2차 비밀번호
  @HiveField(6)
  String? secondPassword;

  /*
  // 상시거래(구매) 규정 표시가 필요한지의 여부
  @HiveField(7)
  bool needShowingBuyTradeRules = true;

  // 상시거래(판매) 규정 표시가 필요한지의 여부
  @HiveField(8)
  bool needShowingSellTradeRules = true;

  // 옥션 규정 표시가 필요한지의 여부
  @HiveField(10)
  bool needShowingAuctionRules = true;
  */
}
