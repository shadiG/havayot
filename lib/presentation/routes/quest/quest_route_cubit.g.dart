// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_route_cubit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestRouteModel extends QuestRouteModel {
  @override
  final Fetchable<BuiltList<Question>> questionsF;
  @override
  final Fetchable<int> questDurationF;
  @override
  final Fetchable<Question> selectedQuestionF;
  @override
  final Fetchable<Choice?> selectedChoiceF;

  factory _$QuestRouteModel([void Function(QuestRouteModelBuilder)? updates]) =>
      (new QuestRouteModelBuilder()..update(updates))._build();

  _$QuestRouteModel._(
      {required this.questionsF,
      required this.questDurationF,
      required this.selectedQuestionF,
      required this.selectedChoiceF})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionsF, r'QuestRouteModel', 'questionsF');
    BuiltValueNullFieldError.checkNotNull(
        questDurationF, r'QuestRouteModel', 'questDurationF');
    BuiltValueNullFieldError.checkNotNull(
        selectedQuestionF, r'QuestRouteModel', 'selectedQuestionF');
    BuiltValueNullFieldError.checkNotNull(
        selectedChoiceF, r'QuestRouteModel', 'selectedChoiceF');
  }

  @override
  QuestRouteModel rebuild(void Function(QuestRouteModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestRouteModelBuilder toBuilder() =>
      new QuestRouteModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestRouteModel &&
        questionsF == other.questionsF &&
        questDurationF == other.questDurationF &&
        selectedQuestionF == other.selectedQuestionF &&
        selectedChoiceF == other.selectedChoiceF;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionsF.hashCode);
    _$hash = $jc(_$hash, questDurationF.hashCode);
    _$hash = $jc(_$hash, selectedQuestionF.hashCode);
    _$hash = $jc(_$hash, selectedChoiceF.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestRouteModel')
          ..add('questionsF', questionsF)
          ..add('questDurationF', questDurationF)
          ..add('selectedQuestionF', selectedQuestionF)
          ..add('selectedChoiceF', selectedChoiceF))
        .toString();
  }
}

class QuestRouteModelBuilder
    implements Builder<QuestRouteModel, QuestRouteModelBuilder> {
  _$QuestRouteModel? _$v;

  Fetchable<BuiltList<Question>>? _questionsF;
  Fetchable<BuiltList<Question>>? get questionsF => _$this._questionsF;
  set questionsF(Fetchable<BuiltList<Question>>? questionsF) =>
      _$this._questionsF = questionsF;

  Fetchable<int>? _questDurationF;
  Fetchable<int>? get questDurationF => _$this._questDurationF;
  set questDurationF(Fetchable<int>? questDurationF) =>
      _$this._questDurationF = questDurationF;

  Fetchable<Question>? _selectedQuestionF;
  Fetchable<Question>? get selectedQuestionF => _$this._selectedQuestionF;
  set selectedQuestionF(Fetchable<Question>? selectedQuestionF) =>
      _$this._selectedQuestionF = selectedQuestionF;

  Fetchable<Choice?>? _selectedChoiceF;
  Fetchable<Choice?>? get selectedChoiceF => _$this._selectedChoiceF;
  set selectedChoiceF(Fetchable<Choice?>? selectedChoiceF) =>
      _$this._selectedChoiceF = selectedChoiceF;

  QuestRouteModelBuilder();

  QuestRouteModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionsF = $v.questionsF;
      _questDurationF = $v.questDurationF;
      _selectedQuestionF = $v.selectedQuestionF;
      _selectedChoiceF = $v.selectedChoiceF;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestRouteModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestRouteModel;
  }

  @override
  void update(void Function(QuestRouteModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestRouteModel build() => _build();

  _$QuestRouteModel _build() {
    final _$result = _$v ??
        new _$QuestRouteModel._(
            questionsF: BuiltValueNullFieldError.checkNotNull(
                questionsF, r'QuestRouteModel', 'questionsF'),
            questDurationF: BuiltValueNullFieldError.checkNotNull(
                questDurationF, r'QuestRouteModel', 'questDurationF'),
            selectedQuestionF: BuiltValueNullFieldError.checkNotNull(
                selectedQuestionF, r'QuestRouteModel', 'selectedQuestionF'),
            selectedChoiceF: BuiltValueNullFieldError.checkNotNull(
                selectedChoiceF, r'QuestRouteModel', 'selectedChoiceF'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
