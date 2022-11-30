import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'progect_detail_list_entity.g.dart';

@JsonSerializable()
class ProgectDetailListEntity {

	late ProgectDetailListData data;
	late int errorCode;
	late String errorMsg;
  
  ProgectDetailListEntity();

  factory ProgectDetailListEntity.fromJson(Map<String, dynamic> json) => _$ProgectDetailListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProgectDetailListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProgectDetailListData {

	late int curPage;
	late List<ProgectDetailListDataDatas> datas;
	late int offset;
	late bool over;
	late int pageCount;
	late int size;
	late int total;
  
  ProgectDetailListData();

  factory ProgectDetailListData.fromJson(Map<String, dynamic> json) => _$ProgectDetailListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProgectDetailListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProgectDetailListDataDatas {

	late bool adminAdd;
	late String apkLink;
	late int audit;
	late String author;
	late bool canEdit;
	late int chapterId;
	late String chapterName;
	late bool collect;
	late int courseId;
	late String desc;
	late String descMd;
	late String envelopePic;
	late bool fresh;
	late String host;
	late int id;
	late bool isAdminAdd;
	late String link;
	late String niceDate;
	late String niceShareDate;
	late String origin;
	late String prefix;
	late String projectLink;
	late int publishTime;
	late int realSuperChapterId;
	late int selfVisible;
	late int shareDate;
	late String shareUser;
	late int superChapterId;
	late String superChapterName;
	late List<ProgectDetailListDataDatasTags> tags;
	late String title;
	late int type;
	late int userId;
	late int visible;
	late int zan;
  
  ProgectDetailListDataDatas();

  factory ProgectDetailListDataDatas.fromJson(Map<String, dynamic> json) => _$ProgectDetailListDataDatasFromJson(json);

  Map<String, dynamic> toJson() => _$ProgectDetailListDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProgectDetailListDataDatasTags {

	late String name;
	late String url;
  
  ProgectDetailListDataDatasTags();

  factory ProgectDetailListDataDatasTags.fromJson(Map<String, dynamic> json) => _$ProgectDetailListDataDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => _$ProgectDetailListDataDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}