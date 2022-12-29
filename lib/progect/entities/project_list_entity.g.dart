// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectListEntity _$ProjectListEntityFromJson(Map<String, dynamic> json) =>
    ProjectListEntity()
      ..data = ProjectListData.fromJson(json['data'] as Map<String, dynamic>)
      ..errorCode = json['errorCode'] as int
      ..errorMsg = json['errorMsg'] as String;

Map<String, dynamic> _$ProjectListEntityToJson(ProjectListEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

ProjectListData _$ProjectListDataFromJson(Map<String, dynamic> json) =>
    ProjectListData()
      ..curPage = json['curPage'] as int
      ..datas = (json['datas'] as List<dynamic>)
          .map((e) => ProjectListDataItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..offset = json['offset'] as int
      ..over = json['over'] as bool
      ..pageCount = json['pageCount'] as int
      ..size = json['size'] as int
      ..total = json['total'] as int;

Map<String, dynamic> _$ProjectListDataToJson(ProjectListData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

ProjectListDataItem _$ProjectListDataItemFromJson(Map<String, dynamic> json) =>
    ProjectListDataItem()
      ..adminAdd = json['adminAdd'] as bool
      ..apkLink = json['apkLink'] as String
      ..audit = json['audit'] as int
      ..author = json['author'] as String
      ..canEdit = json['canEdit'] as bool
      ..chapterId = json['chapterId'] as int
      ..chapterName = json['chapterName'] as String
      ..collect = json['collect'] as bool
      ..courseId = json['courseId'] as int
      ..desc = json['desc'] as String
      ..descMd = json['descMd'] as String
      ..envelopePic = json['envelopePic'] as String
      ..fresh = json['fresh'] as bool
      ..host = json['host'] as String
      ..id = json['id'] as int
      ..isAdminAdd = json['isAdminAdd'] as bool
      ..link = json['link'] as String
      ..niceDate = json['niceDate'] as String
      ..niceShareDate = json['niceShareDate'] as String
      ..origin = json['origin'] as String
      ..prefix = json['prefix'] as String
      ..projectLink = json['projectLink'] as String
      ..publishTime = json['publishTime'] as int
      ..realSuperChapterId = json['realSuperChapterId'] as int
      ..selfVisible = json['selfVisible'] as int
      ..shareDate = json['shareDate'] as int
      ..shareUser = json['shareUser'] as String
      ..superChapterId = json['superChapterId'] as int
      ..superChapterName = json['superChapterName'] as String
      ..tags = (json['tags'] as List<dynamic>)
          .map((e) =>
              ProjectListDataDatasTags.fromJson(e as Map<String, dynamic>))
          .toList()
      ..title = json['title'] as String
      ..type = json['type'] as int
      ..userId = json['userId'] as int
      ..visible = json['visible'] as int
      ..zan = json['zan'] as int;

Map<String, dynamic> _$ProjectListDataItemToJson(
        ProjectListDataItem instance) =>
    <String, dynamic>{
      'adminAdd': instance.adminAdd,
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'host': instance.host,
      'id': instance.id,
      'isAdminAdd': instance.isAdminAdd,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'realSuperChapterId': instance.realSuperChapterId,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };

ProjectListDataDatasTags _$ProjectListDataDatasTagsFromJson(
        Map<String, dynamic> json) =>
    ProjectListDataDatasTags()
      ..name = json['name'] as String
      ..url = json['url'] as String;

Map<String, dynamic> _$ProjectListDataDatasTagsToJson(
        ProjectListDataDatasTags instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
