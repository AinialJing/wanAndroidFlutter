import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'project_list_entity.g.dart';
@JsonSerializable()
class ProjectListEntity {

	late ProjectListData data;
	late int errorCode;
	late String errorMsg;
  
  ProjectListEntity();

  factory ProjectListEntity.fromJson(Map<String, dynamic> json) => _$ProjectListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectListData {

	late int curPage;
	late List<ProjectListDataItem> datas;
	late int offset;
	late bool over;
	late int pageCount;
	late int size;
	late int total;
  
  ProjectListData();

  factory ProjectListData.fromJson(Map<String, dynamic> json) => _$ProjectListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectListDataItem {

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
	late List<ProjectListDataDatasTags> tags;
	late String title;
	late int type;
	late int userId;
	late int visible;
	late int zan;
  
  ProjectListDataItem();

  factory ProjectListDataItem.fromJson(Map<String, dynamic> json) => _$ProjectListDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListDataItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectListDataDatasTags {

	late String name;
	late String url;
  
  ProjectListDataDatasTags();

  factory ProjectListDataDatasTags.fromJson(Map<String, dynamic> json) => _$ProjectListDataDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListDataDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}