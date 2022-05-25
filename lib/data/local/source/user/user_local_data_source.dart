import 'package:ourtube_boilerplate/data/local/persistence/dao/user/document/user_document.dart';
import '../../persistence/dao/user/document/user_document.dart';

abstract class UserLocalDataSource {
  /// 유저 프로필 저장
  Future<void> saveUserProfile(UserDocument document);

  /// 유저 프로필 조회
  Stream<UserDocument> loadUserProfileAsStream();

  /// AuthRepository의 getGuestInfo 함수에서 쓰기 위한, 저장되어 있는 UserDocument를 가져오는 함수.
  UserDocument? loadUserDocumentOnce();

  /// JwtToken 조회
  String? loadJwtToken();

  /// JwtToken 변경
  Future<void> updateJwtToken(String? jwtToken, {bool syncWithUser = false});

  /// 2차 비밀번호 조회
  Future<String?> loadSecondPassword();

  /// 2차 비밀번호 변경
  Future<void> updateSecondPassword(String secondPassword);

  /// 닉네임 변경
  Future<void> updateUserNickName(String nickname);

  /// 계좌 정보 변경
  Future<void> updateUserBankAccount({
    required String? bankCode,
    required String? bankName,
    required String? bankAccountNumber,
  });

  /// 주민등록번호 변경
  Future<void> updateUserIdNumber(String? idNumber);

  /// 로그아웃
  Future<void> signOut();

  /// 생체 인증 사용여부 확인
  bool checkUsingBioAuth();

  /// 생체 인증 사용여부 변경
  Future<void> updateUsingBioAuth({required bool usingBioAuth});

  /// 익명 유저(비회원)인지 인증된 유저인지 저장하는 함수
  Future<void> updateIsCertifiedUser({required bool isCertifiedUser});

  /// 익명 유저(비회원)인지 인증된 유저인지 저장하는 함수
  Stream<bool> checkIsCertifiedUser();
}
