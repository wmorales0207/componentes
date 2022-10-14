import 'package:flutter/material.dart';

/**
 * When a PageRoute is pushed or popped with the Navigator, the entire screen's content is replaced.
 *  An old route disappears and a new route appears. If there's a common visual feature on both routes
 *  then it can be helpful for orienting the user for the feature to physically move from one page to
 *  the other during the routes' transition. Such an animation is called a hero animation. 
 * The hero widgets "fly" in the Navigator's overlay during the transition and while they're in-flight 
 * they're, by default, not shown in their original locations in the old and new routes.

To label a widget as such a feature, wrap it in a Hero widget. When navigation happens, the Hero widgets
 on each route are identified by the HeroController. For each pair of Hero widgets that have the same
  tag, a hero animation is triggered.

If a Hero is already in flight when navigation occurs, its flight animation will be redirected to its 
new destination. The widget shown in-flight during the transition is, by default, the destination 
route's Hero's child.

For a Hero animation to trigger, the Hero has to exist on the very first frame of the new page's 
animation.
 */
class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Hero(
              tag: 'hero-rectangle',
              child: BoxWidget(size: Size(50.0, 50.0)),
            ),
            onTap: () => _gotoDetailsPage(context),
            title: const Text(
              'Tap on the icon to view hero animation transition.',
            ),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: BoxWidget(size: Size(200.0, 200.0)),
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}
