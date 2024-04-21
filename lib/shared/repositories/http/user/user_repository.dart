import 'package:flutter_gym_app/shared/domain/user_domain.dart';
import 'package:flutter_gym_app/shared/repositories/http/dio_client.dart';
import 'package:flutter_gym_app/shared/repositories/http/user/dtos/update_user_dto.dart';
import 'package:flutter_gym_app/shared/repositories/http/user/dtos/user_response.dart';

class UserRepository {
  late DioClient? _dioClient;

  UserRepository([DioClient? dio]) {
    if (dio == null) {
      _dioClient = DioClient();
    } else {
      _dioClient = dio;
    }
  }

  Future<UserResponse> updateUser(UpdateUserDto updateUserDto) async {
    final response = await _dioClient!.put('/users', updateUserDto.toJson());

    return UserResponse.fromJson(response.data);
  }

  Future<UserResponse> getUserInfos(String token) async {
    var option = DioOptions(
      token: token,
    );

    final response = await _dioClient!.get('/users/infos', option);

    return UserResponse.fromJson(response.data);
  }
}