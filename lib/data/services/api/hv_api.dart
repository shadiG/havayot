import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/data/services/utils/built_value_converter.dart';

part 'hv_api.chopper.dart';

@ChopperApi()
abstract class HvApi extends ChopperService {
  static HvApi create([ChopperClient? client]) {
    final client = ChopperClient(
      baseUrl: 'https://havayot.shadgramers.com/api',
      interceptors: [
        const HeadersInterceptor({'Content-Type': 'application/json'}),
      ],
      services: [],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
    );
    return _$HvApi(client);
  }

  @Get(path: '/questions')
  Future<Response<BuiltList<Question>>> getQuestions();
}
