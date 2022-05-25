import 'package:hive_flutter/hive_flutter.dart';
import 'package:ourtube_boilerplate/data/local/persistence/common/error/database_exception.dart';

part 'base_lazy_dao.dart';
part 'base_memory_dao.dart';

abstract class _BaseDao<T extends HiveObject> {
  final BoxBase<T> _box;

  _BaseDao(this._box);

  Future<int> insert(T document) {
    return _box.add(document);
  }

  Future<List<int>> insertAll(Iterable<T> documents) {
    return _box.addAll(documents).then((value) => value.toList());
  }

  Future<void> update(T document) async {
    await _box.put(document.key, document);
  }

  Future<void> updateAll(Iterable<T> documents) async {
    await _box.putAll(
      Map.fromEntries(documents.map((e) => MapEntry(e.key, e))),
    );
  }

  Future<void> delete(int key) async {
    await _box.delete(key);
  }

  Future<void> deleteAll(Iterable<int> keys) async {
    await _box.deleteAll(keys);
  }

  Stream<T> watch(int key) {
    return _box.watch(key: key).asBroadcastStream().map((event) => event.value);
  }

  Stream<T> watchAll() {
    return _box.watch().asBroadcastStream().map((event) => event.value);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  bool get isEmpty => _box.isEmpty;
}
