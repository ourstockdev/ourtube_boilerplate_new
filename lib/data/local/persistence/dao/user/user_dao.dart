import 'package:hive/hive.dart';
import 'package:ourtube_boilerplate/data/local/persistence/common/base/base_dao.dart';
import 'package:ourtube_boilerplate/data/local/persistence/dao/user/document/user_document.dart';

class UserDao extends BaseMemoryDao<UserDocument> {
  UserDao(Box<UserDocument> box) : super(box);
}
