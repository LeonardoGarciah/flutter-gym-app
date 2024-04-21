class UserResponse {
  final String id;
  final String? name;
  final bool? firstAccess;
  final double? height;
  final double? weight;
  final double? yearsOld;
  final String? experience;

  UserResponse({
    required this.id,
    this.name,
    this.firstAccess,
    this.height,
    this.weight,
    this.yearsOld,
    this.experience,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'firstAccess': firstAccess,
    'height': height,
    'weight': weight,
    'yearsOld': yearsOld,
    'experience': experience,
  };

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json['id'],
    name: json['name'],
    firstAccess: json['firstAccess'],
    height: json['height'],
    weight: json['weight'],
    yearsOld: json['yearsOld'],
    experience: json['experience'],
  );
}