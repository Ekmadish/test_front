class CacheClient {
  CacheClient() : _cache = <String, Object>{};
  final Map<String, Object> _cache;

  void write({required String key, required dynamic value}) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
