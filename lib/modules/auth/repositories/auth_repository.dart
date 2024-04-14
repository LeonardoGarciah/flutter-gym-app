import 'package:flutter_gym_app/modules/auth/dtos/login_dto.dart';
import 'package:flutter_gym_app/modules/auth/dtos/login_response.dart';
import 'package:flutter_gym_app/modules/auth/dtos/register_dto.dart';
import 'package:flutter_gym_app/shared/repositories/http/dio_client.dart';

class AuthRepository {
  final DioClient _dio;

  AuthRepository([DioClient? dio]) : _dio = dio ?? DioClient();

  Future<LoginResponse> login(LoginDto loginDto) async {
    var response = await _dio.post('/login', loginDto.toJson());

    return LoginResponse.fromJson(response.data);
  }

  Future<void> register(RegisterDto registerDTO) async {
    await _dio.post('/register', registerDTO.toJson());
  }
}