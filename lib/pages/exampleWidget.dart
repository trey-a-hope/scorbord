import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scorbord/constants.dart';
import 'package:scorbord/models/local/nba_team.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:get_it/get_it.dart';

class ExampleWidget extends StatefulWidget {
  @override
  State createState() => ExampleWidgetState();
}

class ExampleWidgetState extends State<ExampleWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GetIt getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    Map map = await getIt<INBAService>().getPlayer(playerID: 495);
    print(map['last_name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('NBA Teams'),
      ),
      body: ListView.builder(
        itemCount: NBATeams.length,
        itemBuilder: (BuildContext ctx, int index) {
          NBATeam nbaTeam = NBATeams[index];

          return ListTile(
            title: Text(nbaTeam.name),
            subtitle: Text(nbaTeam.city),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(nbaTeam.imgUrl),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content:
                      Text('The ' + nbaTeam.name + ' are my favorite team!')));
            },
          );
        },
      ),
    );
  }
}
