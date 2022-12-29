import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'project_category_entity.g.dart';

@JsonSerializable()
class ProjectCategoryEntity {

	late List<ProjectCategoryData> data;
	late int errorCode;
	late String errorMsg;
  
  ProjectCategoryEntity();

  factory ProjectCategoryEntity.fromJson(Map<String, dynamic> json) => _$ProjectCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCategoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectCategoryData {

	late String author;
	late int courseId;
	late String cover;
	late String desc;
	late int id;
	late String lisense;
	late String lisenseLink;
	late String name;
	late int order;
	late int parentChapterId;
	late int type;
	late bool userControlSetTop;
	late int visible;
  
  ProjectCategoryData();

  factory ProjectCategoryData.fromJson(Map<String, dynamic> json) => _$ProjectCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCategoryDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}