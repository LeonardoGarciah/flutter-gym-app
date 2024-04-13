import 'package:flutter_gym_app/shared/domain/user_domain.dart';

class UserBlocState {
  final UserDomain? user;

  UserBlocState({
    this.user,
  });

  UserBlocState copyWith({
    UserDomain? user,
  }) {
    return UserBlocState(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
  };

  factory UserBlocState.fromJson(Map<String, dynamic> json) => UserBlocState(
    user: json['user'] != null ? UserDomain.fromJson(json['user']) : json['user'],
  );

  factory UserBlocState.initial() => UserBlocState(
    user: null,
  );
}
