class UpdateUserDto {
  final String? name;
  final String? email;
  final String? password;
  final String? experience;
  final double? height;
  final bool? firstAccess;
  final double? weight;
  final double? yearsOld;

  UpdateUserDto({
     this.name,
     this.email,
     this.password,
     this.experience,
     this.height,
     this.firstAccess,
    this.weight,
     this.yearsOld,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'experience': experience,
    'firstAccess': firstAccess,
    'height': height,
    'weight': weight,
    'yearsOld': yearsOld,
  };

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) => UpdateUserDto(
    name: json['name'],
    email: json['email'],
    password: json['password'],
    experience: json['experience'],
    firstAccess: json['firstAccess'],
    height: json['height'],
    weight: json['weight'],
    yearsOld: json['yearsOld'],
  );

  UpdateUserDto copyWith({
    String? name,
    String? email,
    String? password,
    String? experience,
    bool? firstAccess,
    double? height,
    double? weight,
    double? yearsOld,
  }) {
    return UpdateUserDto(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      experience: experience ?? this.experience,
      firstAccess: firstAccess ?? this.firstAccess,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      yearsOld: yearsOld ?? this.yearsOld,
    );
  }
}
