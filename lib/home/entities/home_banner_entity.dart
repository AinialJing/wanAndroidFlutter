import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'home_banner_entity.g.dart';

/// 1、导入import package:json_annotation/json_annotation.dart
/// 2、添加part 'home_banner_entity.g.dart'
/// 3、执行flutter pub run build_runner build或者flutter packages pub run build_runner build lib
@JsonSerializable()
class HomeBannerEntity {

	late List<HomeBannerData> data;
	late int errorCode;
	late String errorMsg;

  HomeBannerEntity();

  factory HomeBannerEntity.fromJson(Map<String, dynamic> json) => _$HomeBannerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerEntityToJson(this);

	@override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeBannerData {

	late String desc;
	late int id;
	late String imagePath;
	late int isVisible;
	late int order;
	late String title;
	late int type;
	late String url;
  
  HomeBannerData();

  factory HomeBannerData.fromJson(Map<String, dynamic> json) => _$HomeBannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerDataToJson(this);

	@override
  String toString() {
    return jsonEncode(this);
  }
}