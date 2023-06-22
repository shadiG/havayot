import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:havayot/data/models/question.dart';
import 'package:havayot/data/services/utils/built_value_converter.dart';

part 'hv_api.chopper.dart';

@ChopperApi()
abstract class HvApi extends ChopperService {
  static HvApi create([ChopperClient? client]) {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://havayot.shadgramers.com/api'),
      interceptors: [
        const HeadersInterceptor({'Content-Type': 'application/json'}),
      ],
      errorConverter: BuiltValueConverter(),
      converter: BuiltValueConverter(),
      services: [],
    );
    return _$HvApi(client);
  }

  @Get(path: '/questions')
  Future<Response<BuiltList<Question>>> getQuestions();
}
