class RegisterDto {
  final String email;
  final String password;
  final String name;

  RegisterDto({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }

  RegisterDto copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return RegisterDto(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}