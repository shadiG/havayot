// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Question> _$questionSerializer = new _$QuestionSerializer();

class _$QuestionSerializer implements StructuredSerializer<Question> {
  @override
  final Iterable<Type> types = const [Question, _$Question];
  @override
  final String wireName = 'Question';

  @override
  Iterable<Object?> serialize(Serializers serializers, Question object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
      'choices',
      serializers.serialize(object.choices,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Choice)])),
    ];

    return result;
  }

  @override
  Question deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionBuilder();

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
        case 'choices':
          result.choices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Choice)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Question extends Question {
  @override
  final String value;
  @override
  final BuiltList<Choice> choices;

  factory _$Question([void Function(QuestionBuilder)? updates]) =>
      (new QuestionBuilder()..update(updates))._build();

  _$Question._({required this.value, required this.choices}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Question', 'value');
    BuiltValueNullFieldError.checkNotNull(choices, r'Question', 'choices');
  }

  @override
  Question rebuild(void Function(QuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBuilder toBuilder() => new QuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
        value == other.value &&
        choices == other.choices;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, choices.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Question')
          ..add('value', value)
          ..add('choices', choices))
        .toString();
  }
}

class QuestionBuilder implements Builder<Question, QuestionBuilder> {
  _$Question? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ListBuilder<Choice>? _choices;
  ListBuilder<Choice> get choices =>
      _$this._choices ??= new ListBuilder<Choice>();
  set choices(ListBuilder<Choice>? choices) => _$this._choices = choices;

  QuestionBuilder();

  QuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _choices = $v.choices.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Question other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Question;
  }

  @override
  void update(void Function(QuestionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Question build() => _build();

  _$Question _build() {
    _$Question _$result;
    try {
      _$result = _$v ??
          new _$Question._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'Question', 'value'),
              choices: choices.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'choices';
        choices.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Question', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
