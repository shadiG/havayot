library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:havayot/data/models/choice.dart';
import 'package:havayot/data/models/question.dart';

part 'serializers.g.dart';

@SerializersFor([
  Choice,
  Question,
])
final Serializers serializers = (
    _$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin(discriminator: 'type'))
      ..addBuilderFactory(const FullType(
          BuiltList, [FullType(Question)]),
              () => ListBuilder<Question>())
).build();
