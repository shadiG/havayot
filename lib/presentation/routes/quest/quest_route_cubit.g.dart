// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_route_cubit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestRouteModel extends QuestRouteModel {
  @override
  final Fetchable<BuiltList<Question>> questionsF;
  @override
  final Fetchable<Countdown> countDownF;
  @override
  final Fetchable<Question> selectedQuestionF;
  @override
  final Fetchable<Choice?> selectedChoiceF;
  @override
  final Fetchable<int> currentQuestPositionF;
  @override
  final Fetchable<int> rightChoicesCountF;

  factory _$QuestRouteModel([void Function(QuestRouteModelBuilder)? updates]) =>
      (new QuestRouteModelBuilder()..update(updates))._build();

  _$QuestRouteModel._(
      {required this.questionsF,
      required this.countDownF,
      required this.selectedQuestionF,
      required this.selectedChoiceF,
      required this.currentQuestPositionF,
      required this.rightChoicesCountF})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionsF, r'QuestRouteModel', 'questionsF');
    BuiltValueNullFieldError.checkNotNull(
        countDownF, r'QuestRouteModel', 'countDownF');
    BuiltValueNullFieldError.checkNotNull(
        selectedQuestionF, r'QuestRouteModel', 'selectedQuestionF');
    BuiltValueNullFieldError.checkNotNull(
        selectedChoiceF, r'QuestRouteModel', 'selectedChoiceF');
    BuiltValueNullFieldError.checkNotNull(
        currentQuestPositionF, r'QuestRouteModel', 'currentQuestPositionF');
    BuiltValueNullFieldError.checkNotNull(
        rightChoicesCountF, r'QuestRouteModel', 'rightChoicesCountF');
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
        countDownF == other.countDownF &&
        selectedQuestionF == other.selectedQuestionF &&
        selectedChoiceF == other.selectedChoiceF &&
        currentQuestPositionF == other.currentQuestPositionF &&
        rightChoicesCountF == other.rightChoicesCountF;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionsF.hashCode);
    _$hash = $jc(_$hash, countDownF.hashCode);
    _$hash = $jc(_$hash, selectedQuestionF.hashCode);
    _$hash = $jc(_$hash, selectedChoiceF.hashCode);
    _$hash = $jc(_$hash, currentQuestPositionF.hashCode);
    _$hash = $jc(_$hash, rightChoicesCountF.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestRouteModel')
          ..add('questionsF', questionsF)
          ..add('countDownF', countDownF)
          ..add('selectedQuestionF', selectedQuestionF)
          ..add('selectedChoiceF', selectedChoiceF)
          ..add('currentQuestPositionF', currentQuestPositionF)
          ..add('rightChoicesCountF', rightChoicesCountF))
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

  Fetchable<Countdown>? _countDownF;
  Fetchable<Countdown>? get countDownF => _$this._countDownF;
  set countDownF(Fetchable<Countdown>? countDownF) =>
      _$this._countDownF = countDownF;

  Fetchable<Question>? _selectedQuestionF;
  Fetchable<Question>? get selectedQuestionF => _$this._selectedQuestionF;
  set selectedQuestionF(Fetchable<Question>? selectedQuestionF) =>
      _$this._selectedQuestionF = selectedQuestionF;

  Fetchable<Choice?>? _selectedChoiceF;
  Fetchable<Choice?>? get selectedChoiceF => _$this._selectedChoiceF;
  set selectedChoiceF(Fetchable<Choice?>? selectedChoiceF) =>
      _$this._selectedChoiceF = selectedChoiceF;

  Fetchable<int>? _currentQuestPositionF;
  Fetchable<int>? get currentQuestPositionF => _$this._currentQuestPositionF;
  set currentQuestPositionF(Fetchable<int>? currentQuestPositionF) =>
      _$this._currentQuestPositionF = currentQuestPositionF;

  Fetchable<int>? _rightChoicesCountF;
  Fetchable<int>? get rightChoicesCountF => _$this._rightChoicesCountF;
  set rightChoicesCountF(Fetchable<int>? rightChoicesCountF) =>
      _$this._rightChoicesCountF = rightChoicesCountF;

  QuestRouteModelBuilder();

  QuestRouteModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionsF = $v.questionsF;
      _countDownF = $v.countDownF;
      _selectedQuestionF = $v.selectedQuestionF;
      _selectedChoiceF = $v.selectedChoiceF;
      _currentQuestPositionF = $v.currentQuestPositionF;
      _rightChoicesCountF = $v.rightChoicesCountF;
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
            countDownF: BuiltValueNullFieldError.checkNotNull(
                countDownF, r'QuestRouteModel', 'countDownF'),
            selectedQuestionF: BuiltValueNullFieldError.checkNotNull(
                selectedQuestionF, r'QuestRouteModel', 'selectedQuestionF'),
            selectedChoiceF: BuiltValueNullFieldError.checkNotNull(
                selectedChoiceF, r'QuestRouteModel', 'selectedChoiceF'),
            currentQuestPositionF: BuiltValueNullFieldError.checkNotNull(
                currentQuestPositionF,
                r'QuestRouteModel',
                'currentQuestPositionF'),
            rightChoicesCountF: BuiltValueNullFieldError.checkNotNull(
                rightChoicesCountF, r'QuestRouteModel', 'rightChoicesCountF'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
