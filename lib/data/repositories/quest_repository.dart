import 'package:built_collection/built_collection.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/data/models/question.dart';

abstract class QuestRepository {
  Future<BuiltList<Question>> getQuestions();
}

class LocalQuestRepository implements QuestRepository {
  @override
  Future<BuiltList<Question>> getQuestions() async {
    return [
      Question((b) => b
        ..value = "Quel roi a écrit la majorité des Psaumes dans la Bible ?"
        ..choices = ['David', 'Salomon', 'Moïse', 'Samuel']
            .map((e) => Choice((c) => c..value = e)).toBuiltList().toBuilder())
    ].toBuiltList();
  }
}
