import 'package:flutter/material.dart';
import 'package:wan_android_flutter/progect/dao/project_dao.dart';
import 'package:wan_android_flutter/progect/entities/project_category_entity.dart';
import 'package:wan_android_flutter/progect/page/project_list_page.dart';

class ProjectHomePage extends StatefulWidget {
  const ProjectHomePage({Key? key}) : super(key: key);

  @override
  State<ProjectHomePage> createState() => _ProjectHomePageState();
}

class _ProjectHomePageState extends State<ProjectHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<ProjectCategoryData> data = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: data.length, vsync: this);
    ProjectDao.getProjectCategoryData((value) {
      setState(() {
        data.addAll(value.data);
        _tabController = TabController(length: data.length, vsync: this);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTab(), _buildTabView()],
    );
  }

  _buildTab() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: Colors.black,
        tabs: data.map<Tab>((category) {
          return Tab(
              child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(category.name),
          ));
        }).toList());
  }

  _buildTabView() {
    return Expanded(
        child: TabBarView(
      controller: _tabController,
      children: data.map<ProjectListPage>((category) {
        return ProjectListPage(category);
      }).toList(),
    ));
  }
}
