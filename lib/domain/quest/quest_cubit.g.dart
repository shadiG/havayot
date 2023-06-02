// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_cubit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestModel extends QuestModel {
  @override
  final Fetchable<BuiltList<Question>> questionsF;
  @override
  final Fetchable<int> questDurationF;

  factory _$QuestModel([void Function(QuestModelBuilder)? updates]) =>
      (new QuestModelBuilder()..update(updates))._build();

  _$QuestModel._({required this.questionsF, required this.questDurationF})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionsF, r'QuestModel', 'questionsF');
    BuiltValueNullFieldError.checkNotNull(
        questDurationF, r'QuestModel', 'questDurationF');
  }

  @override
  QuestModel rebuild(void Function(QuestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestModelBuilder toBuilder() => new QuestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestModel &&
        questionsF == other.questionsF &&
        questDurationF == other.questDurationF;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionsF.hashCode);
    _$hash = $jc(_$hash, questDurationF.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestModel')
          ..add('questionsF', questionsF)
          ..add('questDurationF', questDurationF))
        .toString();
  }
}

class QuestModelBuilder implements Builder<QuestModel, QuestModelBuilder> {
  _$QuestModel? _$v;

  Fetchable<BuiltList<Question>>? _questionsF;
  Fetchable<BuiltList<Question>>? get questionsF => _$this._questionsF;
  set questionsF(Fetchable<BuiltList<Question>>? questionsF) =>
      _$this._questionsF = questionsF;

  Fetchable<int>? _questDurationF;
  Fetchable<int>? get questDurationF => _$this._questDurationF;
  set questDurationF(Fetchable<int>? questDurationF) =>
      _$this._questDurationF = questDurationF;

  QuestModelBuilder();

  QuestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionsF = $v.questionsF;
      _questDurationF = $v.questDurationF;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestModel;
  }

  @override
  void update(void Function(QuestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestModel build() => _build();

  _$QuestModel _build() {
    final _$result = _$v ??
        new _$QuestModel._(
            questionsF: BuiltValueNullFieldError.checkNotNull(
                questionsF, r'QuestModel', 'questionsF'),
            questDurationF: BuiltValueNullFieldError.checkNotNull(
                questDurationF, r'QuestModel', 'questDurationF'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
