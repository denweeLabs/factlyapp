import 'dart:collection';
import 'dart:convert';

class CustomSerializer {
  final Object? _data;

  CustomSerializer(this._data);

  Map<String, dynamic> get serialize => _getJson;

  T deserialize<T>(T Function(Map<String, dynamic> json) factory) => factory(_getJson);

  T? getArguments<T>(T Function(Map<String, dynamic> json) factory) {
    if (_data is Map || _data is LinkedHashMap) {
      return deserialize(factory);
    } else {
      return _data as T?;
    }
  }

  Map<String, dynamic> get _getJson => jsonDecode(jsonEncode(_data)) as Map<String, dynamic>;
}
