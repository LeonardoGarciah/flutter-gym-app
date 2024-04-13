class UserDomain {
  final String id;
  final String name;
  final String token;

  UserDomain({
    required this.id,
    required this.name,
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'token': token,
  };

  factory UserDomain.fromJson(Map<String, dynamic> json) => UserDomain(
    id: json['id'],
    name: json['name'],
    token: json['token'],
  );

  UserDomain copyWith({
    String? id,
    String? name,
    String? token,
  }) {
    return UserDomain(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }
}
