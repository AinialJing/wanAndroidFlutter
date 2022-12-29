import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'user_entity.g.dart';
@JsonSerializable()
class UserEntity {

	late bool admin;
	late List<dynamic> chapterTops;
	late int coinCount;
	late List<dynamic> collectIds;
	late String email;
	late String icon;
	late int id;
	late String nickname;
	late String password;
	late String publicName;
	late String token;
	late int type;
	late String username;
  
  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}