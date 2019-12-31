import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scorbord/common/page_title.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/constants.dart';
import 'package:scorbord/models/local/nba_team.dart';
import 'package:scorbord/services/db.dart';
import 'package:scorbord/services/modal.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isLoading = true;
  final GetIt getIt = GetIt.I;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    try {
      // await getIt<DB>().createGame(
      //   game: Game(
      //       taken: false,
      //       awayTeamID: 1,
      //       potAmount: 20.0,
      //       betPrice: 1.0,
      //       id: '',
      //       time: DateTime.now(),
      //       userID: '',
      //       awayTeamScore: 20,
      //       homeTeamID: 2,
      //       homeTeamScore: 23,
      //       starts: DateTime.now(),
      //       status: 2),
      // );
      // await getIt<DB>().createBet(
      //   gameID: 'djH4yG8q7edZGsAcaTUE',
      //   bet: Bet(
      //     id: '',
      //     homeDigit: 2,
      //     awayDigit: 3,
      //     userID: '',
      //     time: DateTime.now(),
      //   ),
      // );
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      getIt<Modal>().showInSnackBar(
        scaffoldKey: _scaffoldKey,
        text: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PageTitle(title: 'Home'),
        Divider()
      ],
    );
    // return Scaffold(
    //   key: _scaffoldKey,
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //   body: _isLoading
    //       ? Spinner()
    //       : ListView.builder(
    //           itemCount: NBATeams.length,
    //           itemBuilder: (BuildContext ctx, int index) {
    //             return _buildTeamTile(team: NBATeams[index]);
    //           },
    //         ),
    // );
  }

  ListTile _buildTeamTile({@required NBATeam team}) {
    return ListTile(
      onTap: () {
        getIt<Modal>()
            .showInSnackBar(scaffoldKey: _scaffoldKey, text: team.name);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(team.imgUrl),
      ),
      title: Text('${team.city} ${team.name}'),
      subtitle: Text('${team.conference} Conference'),
      trailing: Icon(Icons.chevron_right),
    );
  }
}