import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/widgets/SideDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GetIt getIt = GetIt.I;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: SideDrawer(
        page: 'Home',
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Welcome to Scorbord.'),
            Text('Share game information with your friends.')
          ],
        ),
      ),
    );
  }
}
