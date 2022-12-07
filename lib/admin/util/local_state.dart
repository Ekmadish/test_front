
class CacheClient {
  CacheClient._();
  static final CacheClient _c = CacheClient._();
  factory CacheClient() => _c;
  final Map<String, Object> _cache = {};
  void write({required String key, required dynamic value}) {
    _cache[key] = value;
  }

  read<T extends Object>(String key) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

  

  void dispose() {
    _cache.clear();
  }
}
