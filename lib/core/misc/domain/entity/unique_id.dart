class UniqueId {
  final int value;

  factory UniqueId.fromValue(int value) {
    return UniqueId._(value);
  }

  factory UniqueId.empty() {
    return UniqueId._(-1);
  }

  const UniqueId._(this.value);

  factory UniqueId.fromJson(Map<String, dynamic> json) => UniqueId.fromValue(
        json['value'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  @override
  String toString() {
    return "UniqueId($value)";
  }

  String get stringValue => value.toString();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UniqueId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
