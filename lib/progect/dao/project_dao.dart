import 'package:flutter/material.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';
import 'package:wan_android_flutter/progect/entities/project_category_entity.dart';
import 'package:wan_android_flutter/progect/entities/project_list_entity.dart';
import 'package:wan_android_flutter/progect/request/progect_category_request.dart';
import 'package:wan_android_flutter/progect/request/progect_list_request.dart';

class ProjectDao {
  static getProjectCategoryData(ValueSetter<ProjectCategoryEntity> setter) {
    ProjectCategoryRequest request = ProjectCategoryRequest();
    DioAdapter adapter = DioAdapter();
    adapter.send(request).then((value) {
      ProjectCategoryEntity projectCategoryEntity =
          ProjectCategoryEntity.fromJson(value);
      setter.call(projectCategoryEntity);
    });
  }

  static getProjectListData(int page, int id, ValueSetter<ProjectListEntity> setter) {
    Map<String, dynamic> params = {};
    ProjectListRequest request = ProjectListRequest();
    request.addRESTFullPath('$page/json');
    params['cid'] = id.toString();
    request.addPathParams(params);
    DioAdapter adapter = DioAdapter();
    adapter.send(request).then((value) {
      ProjectListEntity projectListEntity = ProjectListEntity.fromJson(value);
      setter.call(projectListEntity);
    });
  }
}
