
import 'package:flutter_gym_app/shared/domain/user_domain.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

sealed class UserBlocEvent {}
final class UserBlocEventUpdateUser extends UserBlocEvent {
  final UserDomain user;

  UserBlocEventUpdateUser(this.user);
}
final class UserBlocEventClear extends UserBlocEvent {}

class UserBloc extends HydratedBloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocState.initial()) {
    on<UserBlocEventUpdateUser>((event, emit) {
      var newState = UserBlocState(user: state.user?.copyWith(event.user));

      emit(newState);
    });
    on<UserBlocEventClear>((event, emit) {
      emit(UserBlocState.initial());
    });
  }

  @override
  void onTransition(Transition<UserBlocEvent, UserBlocState> transition) {
    super.onTransition(transition);
    print("===========current============");
    print(transition.currentState.toJson());
    print("===========next============");
    print(transition.nextState.toJson());
  }

  @override
  UserBlocState? fromJson(Map<String, dynamic> json) {
    return UserBlocState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserBlocState state) {
    return state.toJson();
  }
}