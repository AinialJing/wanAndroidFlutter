import 'package:json_annotation/json_annotation.dart';

part 'home_banner_entity.g.dart';
@JsonSerializable()
class HomeBannerEntity {

	late List<HomeBannerData> data;
	late int errorCode;
	late String errorMsg;

  HomeBannerEntity();

  factory HomeBannerEntity.fromJson(Map<String, dynamic> json) => _$HomeBannerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerEntityToJson(this);
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
}