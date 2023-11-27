import 'package:componentes/src/pages/Slivers/bottom_navigation.dart';
import 'package:componentes/src/pages/Slivers/pages/fitness_tracker/activities/activities_page.dart';
import 'package:componentes/src/pages/Slivers/pages/networking/networking_page.dart';
import 'package:componentes/src/pages/Slivers/pages/slivers_basic_page.dart';
import 'package:componentes/src/pages/Slivers/sliver_page.dart';
import 'package:flutter/material.dart';

class SliverHomePage extends StatefulWidget {
  @override
  _SliverHomePageState createState() => _SliverHomePageState();
}

class _SliverHomePageState extends State<SliverHomePage> {
  SliverPage _sliverPage = SliverPage.basic;

  void _selectPage(SliverPage sliverPage) =>
      setState(() => _sliverPage = sliverPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        sliverPage: _sliverPage,
        onSelectPage: _selectPage,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildBody() {
    return <SliverPage, WidgetBuilder>{
      SliverPage.basic: (_) => const SliversBasicPage(),
      SliverPage.fetch: (_) => NetworkingPage(),
      SliverPage.custom: (_) => ActivitiesPage.withSampleData(),
//      Page.nested: (_) => NestedScrollViewPage(),
    }[_sliverPage]!(context);
  }
}
