import 'package:flutter/material.dart';

class ExcplicitPageWithAnimatedList extends StatefulWidget {
  const ExcplicitPageWithAnimatedList({super.key});

  @override
  State<ExcplicitPageWithAnimatedList> createState() =>
      _ExcplicitPageWithAnimatedListState();
}

class _ExcplicitPageWithAnimatedListState
    extends State<ExcplicitPageWithAnimatedList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  List<String> names = ["Ahmad", "Noor", "Yaser", "Abo Ahmad"];
  List<Widget> tiles = [];
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  Future future = Future(() {});
  addToList() {
    names.forEach((element) {
      future = future.then((_) {
        return Future.delayed(Duration(seconds: 2), () {
          converToListTile(element);
          listKey.currentState!.insertItem(
            tiles.length-1,
            duration: Duration(seconds: 2),
          );
        });
      });
    });
  }

  converToListTile(String name) {
    tiles.add(ListTile(title: Text(name)));
  }

  @override
  void initState() {
    // controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addToList();
    });
  }

  Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,

        initialItemCount: tiles.length,
        itemBuilder:
            (context, index, animation) => SlideTransition(
              position: animation.drive(offset),

              child: tiles[index],
            ),
      ),
    );
  }
}
