import 'package:flutter/material.dart';
import 'package:wan_android_flutter/progect/dao/project_dao.dart';
import 'package:wan_android_flutter/progect/entities/project_category_entity.dart';
import 'package:wan_android_flutter/progect/entities/project_list_entity.dart';

class ProjectListPage extends StatefulWidget {
  final ProjectCategoryData data;

  const ProjectListPage(this.data, {super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  var page = 0;
  List<ProjectListDataItem> items = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) =>
            ProjectItem(items[index]));
  }

  @override
  void initState() {
    super.initState();
    ProjectDao.getProjectListData(page, widget.data.id, (value) {
      setState(() {
        items.addAll(value.data.datas);
      });
    });
  }
}

class ProjectItem extends StatefulWidget {
  final ProjectListDataItem item;

  const ProjectItem(this.item, {super.key});

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Image.network(widget.item.envelopePic),
            ),
            Expanded(
                child: Container(
                  margin:const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.title,
                          style: const TextStyle(
                              fontSize: 24, color: Colors.blue)),
                      Text(widget.item.desc,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
