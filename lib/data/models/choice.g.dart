// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Choice> _$choiceSerializer = new _$ChoiceSerializer();

class _$ChoiceSerializer implements StructuredSerializer<Choice> {
  @override
  final Iterable<Type> types = const [Choice, _$Choice];
  @override
  final String wireName = 'Choice';

  @override
  Iterable<Object?> serialize(Serializers serializers, Choice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Choice deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Choice extends Choice {
  @override
  final String value;

  factory _$Choice([void Function(ChoiceBuilder)? updates]) =>
      (new ChoiceBuilder()..update(updates))._build();

  _$Choice._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Choice', 'value');
  }

  @override
  Choice rebuild(void Function(ChoiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceBuilder toBuilder() => new ChoiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Choice && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Choice')..add('value', value))
        .toString();
  }
}

class ChoiceBuilder implements Builder<Choice, ChoiceBuilder> {
  _$Choice? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ChoiceBuilder();

  ChoiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Choice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Choice;
  }

  @override
  void update(void Function(ChoiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Choice build() => _build();

  _$Choice _build() {
    final _$result = _$v ??
        new _$Choice._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Choice', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
