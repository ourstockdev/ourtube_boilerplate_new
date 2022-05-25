part of 'base_dao.dart';

abstract class BaseLazyDao<T extends HiveObject> extends _BaseDao<T> {
  final LazyBox<T> box;

  BaseLazyDao(this.box) : super(box);

  Future<T> selectOne(int key) async {
    final result = await box.get(key);
    if (result == null) throw const DatabaseNoResultException();
    return result;
  }
}
