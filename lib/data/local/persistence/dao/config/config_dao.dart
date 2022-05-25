import 'package:hive/hive.dart';
import 'package:ourtube_boilerplate/data/local/persistence/common/base/base_dao.dart';
import 'package:ourtube_boilerplate/data/local/persistence/dao/config/document/config_document.dart';

class ConfigDao extends BaseMemoryDao<ConfigDocument> {
  ConfigDao(Box<ConfigDocument> box) : super(box);

  ConfigDocument getOrNew() {
    if (box.isEmpty) {
      box.add(ConfigDocument());
    }
    return box.values.first;
  }

  // 2차 비밀번호 및 토큰 초기화(로그아웃에서 사용)
  void resetTokenAndSecondPassword() {
    box.values.first.shouldShowSignInScreen = true;
    box.values.first.secondPassword = null;
    box.values.first.jwtToken = null;
    box.values.first.useBioAuth = false;
    box.values.first.isCertifiedUser = false;
    box.values.first.currentUserKey = null;
    /*box.values.first.needShowingAuctionRules = true;
    box.values.first.needShowingBuyTradeRules = true;
    box.values.first.needShowingSellTradeRules = true;*/
    box.values.first.save();
  }

  // 생체 인증 이용 여부 재설정
  void usingBioAuth(bool usingBioAuth) {
    box.values.first.useBioAuth = usingBioAuth;
    box.values.first.save();
  }
}

