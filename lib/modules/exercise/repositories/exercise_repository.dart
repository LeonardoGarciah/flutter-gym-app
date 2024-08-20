import 'package:flutter_gym_app/modules/exercise/dtos/create_exercise_dto.dart';
import 'package:flutter_gym_app/shared/domain/exercise_domain.dart';
import 'package:flutter_gym_app/shared/repositories/http/dio_client.dart';

class ExerciseRepository {
  final DioClient _dio;

  ExerciseRepository([DioClient? dio]) : _dio = dio ?? DioClient();

  Future<void> create(CreateExerciseDto dto) async {
    await _dio.post('/exercise', dto.toJson());
  }

  Future<void> update(CreateExerciseDto dto) async {
    await _dio.put('/exercise', dto.toJson());
  }

  Future<List<ExerciseDomain>> getAll() async {
    var response = await _dio.get('/exercise');

    return response.data.map<ExerciseDomain>((e) => ExerciseDomain.fromJson(e)).toList();
  }
}
