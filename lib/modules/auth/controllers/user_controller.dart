import 'package:flutter_gym_app/shared/domain/user_domain.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_gym_app/shared/repositories/http/user/user_repository.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class UserController {
  late UserRepository _userRepository;

  UserController([UserRepository? userRepository]) {
    _userRepository = userRepository ?? UserRepository();
  }

  Future<void> updateUser(String token) async {
    UserBloc userBloc = GetService.getBloc(() => UserBloc());

    var response = await  _userRepository.getUserInfos(token);

    userBloc.add(
      UserBlocEventUpdateUser(
        UserDomain(
          firstAccess: response.firstAccess,
        ),
      ),
    );
  }
}