import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'home_list_entity.g.dart';

@JsonSerializable()
class HomeListEntity {
  late HomeListData data;
  late int errorCode;
  late String errorMsg;

  HomeListEntity();

  factory HomeListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeListData {
  late int curPage;
  late List<HomeListDataItem> datas;
  late int offset;
  late bool over;
  late int pageCount;
  late int size;
  late int total;

  HomeListData();

  factory HomeListData.fromJson(Map<String, dynamic> json) =>
      _$HomeListDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeListDataItem {
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
  late List<dynamic> tags;
  late String title;
  late int type;
  late int userId;
  late int visible;
  late int zan;

  HomeListDataItem();

  factory HomeListDataItem.fromJson(Map<String, dynamic> json) =>
      _$HomeListDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListDataItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
