import 'package:built_collection/built_collection.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/data/services/api/hv_api.dart';

abstract class QuestRepository {
  Future<BuiltList<Question>> getQuestions();
}

class CloudQuestRepository implements QuestRepository {
  final HvApi api;
  CloudQuestRepository({required this.api});
  @override
  Future<BuiltList<Question>> getQuestions() async {
    try {
      final response = await api.getQuestions();
      return response.body!;
    } catch (e) {
      print(e);
      return BuiltList<Question>();
    }
  }
}

class LocalQuestRepository implements QuestRepository {
  @override
  Future<BuiltList<Question>> getQuestions() async {
    return [
      Question((b) => b
        ..value = "Quel roi a écrit la majorité des Psaumes dans la Bible ?"
        ..options = "David, Salomon, Moïse, Samuel"
        ..answer = 'David'),
      Question((b) => b
        ..value = "Combien de disciples Jésus avait-il ?"
        ..options = "12,10, 7, 15"
        ..answer = '12'),
      Question((b) => b
        ..value = "Quel apôtre a renié Jésus trois fois avant le chant du coq ?"
        ..options = "Pierre, Jean, Jacques, André"
        ..answer = 'Pierre'),
      Question((b) => b
        ..value = "Quel est le premier livre de l'Ancien Testament ?"
        ..options = "Genèse, Exode, Lévitique, Nombres"
        ..answer = 'Genèse'),
      Question((b) => b
        ..value = "Quel est le dernier livre de l'Ancien Testament ?"
        ..options = "Malachie, Zacharie, Joël, Michée"
        ..answer = 'Malachie'),
    ].toBuiltList();
  }
}
