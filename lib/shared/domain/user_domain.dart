class UserDomain {
  final String token;

  UserDomain({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
  };

  factory UserDomain.fromJson(Map<String, dynamic> json) => UserDomain(
    token: json['token'],
  );

  UserDomain copyWith({
    String? id,
    String? name,
    String? token,
  }) {
    return UserDomain(
      token: token ?? this.token,
    );
  }
}
