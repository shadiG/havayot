import 'package:built_collection/built_collection.dart';
import 'package:havayot/data/models/question.dart';

extension QuestionExtension on Question {
  double progression(BuiltList<Question> questions) {
    final indexOfQuestion = questions.indexWhere((q) => q == this);
    return (indexOfQuestion + 1 == questions.length) ? 1.0 : indexOfQuestion / questions.length;
  }
}
