import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scorbord/pages/games/games_page.dart';
import 'package:scorbord/pages/home/home_page.dart';
import 'package:scorbord/pages/profile/profile_page.dart';
import 'package:scorbord/pages/search/search_page.dart';
import 'package:scorbord/pages/settings/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Holder extends StatefulWidget {
  @override
  State createState() => HolderState();
}

class HolderState extends State<Holder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Widget> _children = [
    Container(
      color: Colors.red,
      child: HomePage(),
    ),
    Container(
      color: Colors.blue,
      child: GamesPage(),
    ),
    Container(
      color: Colors.cyan,
      child: SearchPage(),
    ),
    Container(
      color: Colors.green,
      child: ProfilePage(),
    ),
    Container(
      color: Colors.amber[900],
      child: SettingsPage(),
    )
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.amber[900],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: _colors[_currentIndex],
        items: <Widget>[
          Icon(
            MdiIcons.home,
            color: _currentIndex == 0 ? _colors[_currentIndex] : Colors.black,
          ),
          Icon(
            Icons.attach_money,
            color: _currentIndex == 1 ? _colors[_currentIndex] : Colors.black,
          ),
          Icon(
            Icons.search,
            color: _currentIndex == 2 ? _colors[_currentIndex] : Colors.black,
          ),
          Icon(
            Icons.face,
            color: _currentIndex == 3 ? _colors[_currentIndex] : Colors.black,
          ),
          Icon(
            MdiIcons.settings,
            color: _currentIndex == 4 ? _colors[_currentIndex] : Colors.black,
          )
        ],
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
