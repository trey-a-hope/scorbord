import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/pages/HomePage.dart';
import 'package:scorbord/pages/PlayersPage.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key key, @required this.page}) : super(key: key);

  final String page;

  @override
  State createState() => SideDrawerState(page: page);
}

class SideDrawerState extends State<SideDrawer> {
  SideDrawerState({@required this.page});

  final String page;
  final Color iconColor = Colors.black;

  final GetIt getIt = GetIt.I;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Welcome back, Trey'),
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: iconColor),
            title: Text('Home'),
            onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
            },
          ),
                    ListTile(
            leading: Icon(Icons.people, color: iconColor),
            title: Text('Players'),
            onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PlayersPage(),
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}
