// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerEntity _$HomeBannerEntityFromJson(Map<String, dynamic> json) =>
    HomeBannerEntity()
      ..data = (json['data'] as List<dynamic>)
          .map((e) => HomeBannerData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..errorCode = json['errorCode'] as int
      ..errorMsg = json['errorMsg'] as String;

Map<String, dynamic> _$HomeBannerEntityToJson(HomeBannerEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

HomeBannerData _$HomeBannerDataFromJson(Map<String, dynamic> json) =>
    HomeBannerData()
      ..desc = json['desc'] as String
      ..id = json['id'] as int
      ..imagePath = json['imagePath'] as String
      ..isVisible = json['isVisible'] as int
      ..order = json['order'] as int
      ..title = json['title'] as String
      ..type = json['type'] as int
      ..url = json['url'] as String;

Map<String, dynamic> _$HomeBannerDataToJson(HomeBannerData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
