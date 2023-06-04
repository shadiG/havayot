// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_cubit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestModel> _$questModelSerializer = new _$QuestModelSerializer();

class _$QuestModelSerializer implements StructuredSerializer<QuestModel> {
  @override
  final Iterable<Type> types = const [QuestModel, _$QuestModel];
  @override
  final String wireName = 'QuestModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuestModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'questionsF',
      serializers.serialize(object.questionsF,
          specifiedType: const FullType(Fetchable, const [
            const FullType(BuiltList, const [const FullType(Question)])
          ])),
      'questionsToPlayF',
      serializers.serialize(object.questionsToPlayF,
          specifiedType: const FullType(Fetchable, const [
            const FullType(BuiltList, const [const FullType(Question)])
          ])),
      'countDownF',
      serializers.serialize(object.countDownF,
          specifiedType:
              const FullType(Fetchable, const [const FullType(Countdown)])),
      'selectedQuestionF',
      serializers.serialize(object.selectedQuestionF,
          specifiedType:
              const FullType(Fetchable, const [const FullType(Question)])),
      'selectedChoiceF',
      serializers.serialize(object.selectedChoiceF,
          specifiedType: const FullType(
              Fetchable, const [const FullType.nullable(Choice)])),
      'currentQuestPositionF',
      serializers.serialize(object.currentQuestPositionF,
          specifiedType:
              const FullType(Fetchable, const [const FullType(int)])),
      'rightChoicesCountF',
      serializers.serialize(object.rightChoicesCountF,
          specifiedType:
              const FullType(Fetchable, const [const FullType(int)])),
      'questDurationF',
      serializers.serialize(object.questDurationF,
          specifiedType:
              const FullType(Fetchable, const [const FullType(int)])),
      'goToNextQuestionP',
      serializers.serialize(object.goToNextQuestionP,
          specifiedType: const FullType(Progressable)),
      'automaticallyGoToNextQuestionP',
      serializers.serialize(object.automaticallyGoToNextQuestionP,
          specifiedType: const FullType(Progressable)),
    ];

    return result;
  }

  @override
  QuestModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'questionsF':
          result.questionsF = serializers.deserialize(value,
              specifiedType: const FullType(Fetchable, const [
                const FullType(BuiltList, const [const FullType(Question)])
              ]))! as Fetchable<BuiltList<Question>>;
          break;
        case 'questionsToPlayF':
          result.questionsToPlayF = serializers.deserialize(value,
              specifiedType: const FullType(Fetchable, const [
                const FullType(BuiltList, const [const FullType(Question)])
              ]))! as Fetchable<BuiltList<Question>>;
          break;
        case 'countDownF':
          result.countDownF = serializers.deserialize(value,
                  specifiedType: const FullType(
                      Fetchable, const [const FullType(Countdown)]))!
              as Fetchable<Countdown>;
          break;
        case 'selectedQuestionF':
          result.selectedQuestionF = serializers.deserialize(value,
                  specifiedType: const FullType(
                      Fetchable, const [const FullType(Question)]))!
              as Fetchable<Question>;
          break;
        case 'selectedChoiceF':
          result.selectedChoiceF = serializers.deserialize(value,
                  specifiedType: const FullType(
                      Fetchable, const [const FullType.nullable(Choice)]))!
              as Fetchable<Choice?>;
          break;
        case 'currentQuestPositionF':
          result.currentQuestPositionF = serializers.deserialize(value,
                  specifiedType:
                      const FullType(Fetchable, const [const FullType(int)]))!
              as Fetchable<int>;
          break;
        case 'rightChoicesCountF':
          result.rightChoicesCountF = serializers.deserialize(value,
                  specifiedType:
                      const FullType(Fetchable, const [const FullType(int)]))!
              as Fetchable<int>;
          break;
        case 'questDurationF':
          result.questDurationF = serializers.deserialize(value,
                  specifiedType:
                      const FullType(Fetchable, const [const FullType(int)]))!
              as Fetchable<int>;
          break;
        case 'goToNextQuestionP':
          result.goToNextQuestionP = serializers.deserialize(value,
              specifiedType: const FullType(Progressable))! as Progressable;
          break;
        case 'automaticallyGoToNextQuestionP':
          result.automaticallyGoToNextQuestionP = serializers.deserialize(value,
              specifiedType: const FullType(Progressable))! as Progressable;
          break;
      }
    }

    return result.build();
  }
}

class _$QuestModel extends QuestModel {
  @override
  final Fetchable<BuiltList<Question>> questionsF;
  @override
  final Fetchable<BuiltList<Question>> questionsToPlayF;
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
  @override
  final Fetchable<int> questDurationF;
  @override
  final Progressable goToNextQuestionP;
  @override
  final Progressable automaticallyGoToNextQuestionP;

  factory _$QuestModel([void Function(QuestModelBuilder)? updates]) =>
      (new QuestModelBuilder()..update(updates))._build();

  _$QuestModel._(
      {required this.questionsF,
      required this.questionsToPlayF,
      required this.countDownF,
      required this.selectedQuestionF,
      required this.selectedChoiceF,
      required this.currentQuestPositionF,
      required this.rightChoicesCountF,
      required this.questDurationF,
      required this.goToNextQuestionP,
      required this.automaticallyGoToNextQuestionP})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionsF, r'QuestModel', 'questionsF');
    BuiltValueNullFieldError.checkNotNull(
        questionsToPlayF, r'QuestModel', 'questionsToPlayF');
    BuiltValueNullFieldError.checkNotNull(
        countDownF, r'QuestModel', 'countDownF');
    BuiltValueNullFieldError.checkNotNull(
        selectedQuestionF, r'QuestModel', 'selectedQuestionF');
    BuiltValueNullFieldError.checkNotNull(
        selectedChoiceF, r'QuestModel', 'selectedChoiceF');
    BuiltValueNullFieldError.checkNotNull(
        currentQuestPositionF, r'QuestModel', 'currentQuestPositionF');
    BuiltValueNullFieldError.checkNotNull(
        rightChoicesCountF, r'QuestModel', 'rightChoicesCountF');
    BuiltValueNullFieldError.checkNotNull(
        questDurationF, r'QuestModel', 'questDurationF');
    BuiltValueNullFieldError.checkNotNull(
        goToNextQuestionP, r'QuestModel', 'goToNextQuestionP');
    BuiltValueNullFieldError.checkNotNull(automaticallyGoToNextQuestionP,
        r'QuestModel', 'automaticallyGoToNextQuestionP');
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
        questionsToPlayF == other.questionsToPlayF &&
        countDownF == other.countDownF &&
        selectedQuestionF == other.selectedQuestionF &&
        selectedChoiceF == other.selectedChoiceF &&
        currentQuestPositionF == other.currentQuestPositionF &&
        rightChoicesCountF == other.rightChoicesCountF &&
        questDurationF == other.questDurationF &&
        goToNextQuestionP == other.goToNextQuestionP &&
        automaticallyGoToNextQuestionP == other.automaticallyGoToNextQuestionP;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionsF.hashCode);
    _$hash = $jc(_$hash, questionsToPlayF.hashCode);
    _$hash = $jc(_$hash, countDownF.hashCode);
    _$hash = $jc(_$hash, selectedQuestionF.hashCode);
    _$hash = $jc(_$hash, selectedChoiceF.hashCode);
    _$hash = $jc(_$hash, currentQuestPositionF.hashCode);
    _$hash = $jc(_$hash, rightChoicesCountF.hashCode);
    _$hash = $jc(_$hash, questDurationF.hashCode);
    _$hash = $jc(_$hash, goToNextQuestionP.hashCode);
    _$hash = $jc(_$hash, automaticallyGoToNextQuestionP.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestModel')
          ..add('questionsF', questionsF)
          ..add('questionsToPlayF', questionsToPlayF)
          ..add('countDownF', countDownF)
          ..add('selectedQuestionF', selectedQuestionF)
          ..add('selectedChoiceF', selectedChoiceF)
          ..add('currentQuestPositionF', currentQuestPositionF)
          ..add('rightChoicesCountF', rightChoicesCountF)
          ..add('questDurationF', questDurationF)
          ..add('goToNextQuestionP', goToNextQuestionP)
          ..add(
              'automaticallyGoToNextQuestionP', automaticallyGoToNextQuestionP))
        .toString();
  }
}

class QuestModelBuilder implements Builder<QuestModel, QuestModelBuilder> {
  _$QuestModel? _$v;

  Fetchable<BuiltList<Question>>? _questionsF;
  Fetchable<BuiltList<Question>>? get questionsF => _$this._questionsF;
  set questionsF(Fetchable<BuiltList<Question>>? questionsF) =>
      _$this._questionsF = questionsF;

  Fetchable<BuiltList<Question>>? _questionsToPlayF;
  Fetchable<BuiltList<Question>>? get questionsToPlayF =>
      _$this._questionsToPlayF;
  set questionsToPlayF(Fetchable<BuiltList<Question>>? questionsToPlayF) =>
      _$this._questionsToPlayF = questionsToPlayF;

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

  Fetchable<int>? _questDurationF;
  Fetchable<int>? get questDurationF => _$this._questDurationF;
  set questDurationF(Fetchable<int>? questDurationF) =>
      _$this._questDurationF = questDurationF;

  Progressable? _goToNextQuestionP;
  Progressable? get goToNextQuestionP => _$this._goToNextQuestionP;
  set goToNextQuestionP(Progressable? goToNextQuestionP) =>
      _$this._goToNextQuestionP = goToNextQuestionP;

  Progressable? _automaticallyGoToNextQuestionP;
  Progressable? get automaticallyGoToNextQuestionP =>
      _$this._automaticallyGoToNextQuestionP;
  set automaticallyGoToNextQuestionP(
          Progressable? automaticallyGoToNextQuestionP) =>
      _$this._automaticallyGoToNextQuestionP = automaticallyGoToNextQuestionP;

  QuestModelBuilder();

  QuestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionsF = $v.questionsF;
      _questionsToPlayF = $v.questionsToPlayF;
      _countDownF = $v.countDownF;
      _selectedQuestionF = $v.selectedQuestionF;
      _selectedChoiceF = $v.selectedChoiceF;
      _currentQuestPositionF = $v.currentQuestPositionF;
      _rightChoicesCountF = $v.rightChoicesCountF;
      _questDurationF = $v.questDurationF;
      _goToNextQuestionP = $v.goToNextQuestionP;
      _automaticallyGoToNextQuestionP = $v.automaticallyGoToNextQuestionP;
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
            questionsToPlayF: BuiltValueNullFieldError.checkNotNull(
                questionsToPlayF, r'QuestModel', 'questionsToPlayF'),
            countDownF: BuiltValueNullFieldError.checkNotNull(
                countDownF, r'QuestModel', 'countDownF'),
            selectedQuestionF: BuiltValueNullFieldError.checkNotNull(
                selectedQuestionF, r'QuestModel', 'selectedQuestionF'),
            selectedChoiceF: BuiltValueNullFieldError.checkNotNull(
                selectedChoiceF, r'QuestModel', 'selectedChoiceF'),
            currentQuestPositionF: BuiltValueNullFieldError.checkNotNull(
                currentQuestPositionF, r'QuestModel', 'currentQuestPositionF'),
            rightChoicesCountF: BuiltValueNullFieldError.checkNotNull(
                rightChoicesCountF, r'QuestModel', 'rightChoicesCountF'),
            questDurationF: BuiltValueNullFieldError.checkNotNull(
                questDurationF, r'QuestModel', 'questDurationF'),
            goToNextQuestionP:
                BuiltValueNullFieldError.checkNotNull(goToNextQuestionP, r'QuestModel', 'goToNextQuestionP'),
            automaticallyGoToNextQuestionP: BuiltValueNullFieldError.checkNotNull(automaticallyGoToNextQuestionP, r'QuestModel', 'automaticallyGoToNextQuestionP'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
