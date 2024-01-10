import 'package:flutter/material.dart';

class Tip7 extends StatefulWidget {
  const Tip7({super.key});
  static const route = "NOOOOListView";

  @override
  State<Tip7> createState() => _Tip7State();
}

class _Tip7State extends State<Tip7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 50,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: FittedBox(
                      child: Text(index.toString()),
                    ),
                  );
                },
                
                childCount: 10,
              ),
            ),

            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   controller: ScrollController(),
            //   itemCount: 10,
            //   itemBuilder: (BuildContext context, int index) {
            //     Container(
            //       height: 50,
            //       color: Colors.primaries[index + 7 % Colors.primaries.length],
            //       child: FittedBox(
            //         child: Text(index.toString()),
            //       ),
            //     );
            //   },
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 150,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: FittedBox(
                      child: Text(index.toString()),
                    ),
                  );
                },
                childCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
