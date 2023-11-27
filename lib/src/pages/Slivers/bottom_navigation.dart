import 'package:flutter/material.dart';
//import 'package:slivers_demo_flutter/page.dart';
import 'sliver_page.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({required Key key, required this.sliverPage, required this.onSelectPage})
      : super(key: key);
  final SliverPage sliverPage;
  final ValueChanged<SliverPage> onSelectPage;

  Color _color(SliverPage page) => sliverPage == page ? Colors.indigo : Colors.grey;

  static const Map<SliverPage, IconData> icons = {
  
    SliverPage.basic: Icons.view_headline,
    SliverPage.fetch: Icons.cloud_download,
    SliverPage.custom: Icons.directions_run,
//    Page.nested: Icons.table_chart,
  };
  static const Map<SliverPage, String> names = {
    SliverPage.basic: 'basic',
    SliverPage.fetch: 'networking',
    SliverPage.custom: 'custom',
//    Page.nested: 'nested',
  };

  BottomNavigationBarItem _buildItem(SliverPage sliverPage) {
    return BottomNavigationBarItem(
      icon: Icon(
        icons[sliverPage],
        color: _color(sliverPage),
      ),
      // title: Text(
      //   names[sliverPage.name]!,
      //   style: TextStyle(
      //     color: _color(sliverPage),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: SliverPage.values.map(_buildItem).toList(),
      onTap: (index) => onSelectPage(SliverPage.values[index]),
    );
  }
}
