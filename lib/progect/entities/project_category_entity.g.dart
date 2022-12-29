// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectCategoryEntity _$ProjectCategoryEntityFromJson(
        Map<String, dynamic> json) =>
    ProjectCategoryEntity()
      ..data = (json['data'] as List<dynamic>)
          .map((e) => ProjectCategoryData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..errorCode = json['errorCode'] as int
      ..errorMsg = json['errorMsg'] as String;

Map<String, dynamic> _$ProjectCategoryEntityToJson(
        ProjectCategoryEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

ProjectCategoryData _$ProjectCategoryDataFromJson(Map<String, dynamic> json) =>
    ProjectCategoryData()
      ..author = json['author'] as String
      ..courseId = json['courseId'] as int
      ..cover = json['cover'] as String
      ..desc = json['desc'] as String
      ..id = json['id'] as int
      ..lisense = json['lisense'] as String
      ..lisenseLink = json['lisenseLink'] as String
      ..name = json['name'] as String
      ..order = json['order'] as int
      ..parentChapterId = json['parentChapterId'] as int
      ..type = json['type'] as int
      ..userControlSetTop = json['userControlSetTop'] as bool
      ..visible = json['visible'] as int;

Map<String, dynamic> _$ProjectCategoryDataToJson(
        ProjectCategoryData instance) =>
    <String, dynamic>{
      'author': instance.author,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
