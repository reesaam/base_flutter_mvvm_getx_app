import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  LocalStorageService() {
    _init();
  }

  late GetStorage _storage;
  void _init() => _storage = GetStorage();

  Map<String, dynamic> get changes => _storage.changes;

  getKeys() => _storage.getKeys();

  bool hasData(String key) => _storage.hasData(key);

  Map<String, dynamic>? read(String key) {
    final data = _storage.read<String?>(key);
    return data == null ? null : convert.jsonDecode(data);
  }

  Future<void> write(String key, Map<String, dynamic> value) async {
    await _storage.write(key, convert.jsonEncode(value));
    await _storage.save();
  }

  remove(String key) async {
    await _storage.remove(key);
  }
}
