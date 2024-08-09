import 'dart:convert';

class Actor {
  int gender;
  int id;
  String name;
  String originalName;
  String? profilePath;
  String? character;

  Actor({
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    this.profilePath,
    this.character,
  });

  get fullProfileImg {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    } else {
      return 'https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg';
    }
  }

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        profilePath: json["profile_path"],
        character: json["character"],
      );
}
