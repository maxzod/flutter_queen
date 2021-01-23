import 'package:flutter_queen/src/imports.dart';

/// * UI compoent acting as navigation Bar it will
/// * if scrren width is less than 1010 pixle it will show logo / first child
/// * and make a side button on click it will open a drawer containt column in it all the children
/// * else it will show all the the children
/// ! dont user ListView / Scroll View  if you need thmen make suren it will look like this
/// ! NavBar(children:[[HomeButton,Expanded(child:ListView(),),],],)
/// ? if textDirection ==  TextDirection.rtl
/// ? drawer will be at the left side else it will be on the right

class QueenNavBar extends StatelessWidget {
  final List<Widget> children;

  /// * [required]
  final Widget logo;

  /// *  [Optional] default is blue
  final Color color;

  /// * [optional] deffult is left-to-right
  final TextDirection textDirection;

  final Widget Function() drawerButtonBuilder;

  QueenNavBar({
    @required this.logo,
    this.drawerButtonBuilder,
    this.children = const [],
    this.color = Colors.deepOrange,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bar =
        screenWidth < 1010 ? buildForSmallScreens() : buildForLargeScreens();
    print(screenWidth < 1010 ? "now small" : "now large");
    return Container(
      height: AppBar().preferredSize.height,
      width: double.infinity,
      color: this.color,
      child: Directionality(
        textDirection: this.textDirection,
        child: bar,
      ),
    );
  }

  Widget buildDrawerButton() {
    if (this.children.length > 1) {
      // you need a drawer button
      // if no builder provider the bulild standerd one
      if (this.drawerButtonBuilder == null) {
        return OutlineButton(
          onPressed: () {
            print('build your own drawer button using `drawerButtonBuilder`');
          },
          child: const Icon(Icons.menu),
        );
      } else {
        return this.drawerButtonBuilder();
      }
    } else {
      return Container();
    }
  }

  Widget buildForSmallScreens() {
    final Widget firstChild =
        this.children.length > 0 ? this.children[0] : Container();

    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this.logo ?? const Text("Queen 👑"),
          const Spacer(),
          firstChild,
          buildDrawerButton()
        ],
      ),
    );
  }

  Widget buildForLargeScreens() {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this.logo ?? const Text("Queen 👑"),
          const Spacer(),
          ...this.children,
        ],
      ),
    );
  }
}
