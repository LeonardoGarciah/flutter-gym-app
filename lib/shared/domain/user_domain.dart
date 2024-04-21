class UserDomain {
  final String? token;
  final bool? firstAccess;

  UserDomain({
    this.token,
    this.firstAccess,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
    'firstAccess': firstAccess,
  };

  factory UserDomain.fromJson(Map<String, dynamic> json) => UserDomain(
    token: json['token'],
    firstAccess: json['firstAccess'],
  );

  UserDomain copyWith(UserDomain user) {
    return UserDomain(
      token: user.token ?? token,
      firstAccess: user.firstAccess ?? firstAccess,
    );
  }
}
