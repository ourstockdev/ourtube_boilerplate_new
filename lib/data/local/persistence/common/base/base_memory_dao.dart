part of 'base_dao.dart';

abstract class BaseMemoryDao<T extends HiveObject> extends _BaseDao<T> {
  final Box<T> box;

  BaseMemoryDao(this.box) : super(box);

  T selectOne(int key) {
    final result = box.get(key);
    if (result == null) throw const DatabaseNoResultException();
    return result;
  }

  List<T> selectAll() {
    return box.values.toList();
  }
}
