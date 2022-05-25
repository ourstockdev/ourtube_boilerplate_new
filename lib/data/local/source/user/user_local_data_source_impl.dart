import 'package:ourtube_boilerplate/data/local/persistence/hive/extension/hive_object_extension.dart';
import 'package:ourtube_boilerplate/data/local/source/user/user_local_data_source.dart';
import '../../persistence/dao/config/config_dao.dart';
import '../../persistence/dao/user/document/user_document.dart';
import '../../persistence/dao/user/user_dao.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final ConfigDao _configDao;
  final UserDao _userDao;

  UserLocalDataSourceImpl(this._configDao, this._userDao);

  @override
  Future<String?> loadSecondPassword() async {
    return _configDao.getOrNew().secondPassword;
  }

  @override
  Future<void> updateSecondPassword(final String password) async {
    await _configDao.getOrNew().update((config) {
      config.secondPassword = password;
    });
  }

  @override
  String? loadJwtToken() {
    return _configDao.getOrNew().jwtToken;
  }

  @override
  Future<void> updateJwtToken(
    final String? jwtToken, {
    final bool syncWithUser = false,
  }) async {
    await _configDao.getOrNew().update((config) {
      config.jwtToken = jwtToken;
      config.shouldShowSignInScreen = false;

      if (syncWithUser && jwtToken != null) {
        final userKey = config.currentUserKey;
        if (userKey != null) {
          _userDao.selectOne(userKey).update((user) {
            user.jwtToken = jwtToken;
          });
        }
      }
    });
  }

  @override
  Future<void> saveUserProfile(final UserDocument document) async {
    final userKey = await _userDao.insert(document);
    await _configDao.getOrNew().update((config) {
      config.jwtToken = document.jwtToken;
      config.currentUserKey = userKey;
      config.shouldShowSignInScreen = false;
      config.isCertifiedUser = true;
    });
  }

  @override
  Stream<UserDocument> loadUserProfileAsStream() {
    return Stream.multi((controller) {
      try {
        controller.add(_userDao.selectAll().first);
        _userDao.watchAll().listen((event) => controller.add(event));
      } on StateError catch (e) {
        controller.addError(e);
      }
    });
  }

  @override
  UserDocument? loadUserDocumentOnce() {
    if (_userDao.box.isEmpty) {
      return null;
    }

    return _userDao.box.values.first;
  }

  @override
  Future<void> updateUserBankAccount({
    required String? bankCode,
    required String? bankName,
    required String? bankAccountNumber,
  }) async {
    await _userDao.selectAll().first.update((user) {
      user.bankCode = bankCode;
      user.bankName = bankName;
      user.bankAccountNumber = bankAccountNumber;
    });
  }

  @override
  Future<void> updateUserIdNumber(String? idNumber) async {
    await _userDao.selectAll().first.update((user) {
      user.userIdNumber = idNumber;
    });
  }

  @override
  Future<void> updateUserNickName(String nickname) async {
    await _userDao.selectAll().first.update((user) {
      user.userNickname = nickname;
    });
  }

  @override
  Future<void> signOut() async {
    await _userDao.clearAll();
    _configDao.resetTokenAndSecondPassword();
  }

  /// 생체 인증 사용여부 확인
  @override
  bool checkUsingBioAuth() {
    return _configDao.getOrNew().useBioAuth;
  }

  /// 생체 인증 사용여부 변경
  @override
  Future<void> updateUsingBioAuth({required bool usingBioAuth}) async {
    _configDao.usingBioAuth(usingBioAuth);
  }

  /// 익명 유저(비회원)인지 인증된 유저인지 저장하는 함수
  @override
  Future<void> updateIsCertifiedUser({required bool isCertifiedUser}) async {
    await _configDao.getOrNew().update((config) {
      config.isCertifiedUser = isCertifiedUser;
    });
  }

  /// 익명 유저(비회원)인지 인증된 유저인지 저장하는 함수
  @override
  Stream<bool> checkIsCertifiedUser() {
    return Stream.multi((controller) {
      try {
        controller.add(_configDao.getOrNew().isCertifiedUser);
        _configDao.watchAll().listen((event) => controller.add(event.isCertifiedUser));
      } on StateError catch (e) {
        controller.addError(e);
      }
    });
  }
}
