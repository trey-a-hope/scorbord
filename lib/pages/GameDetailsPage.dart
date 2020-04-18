import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/constants.dart';
import 'package:scorbord/models/GameModel.dart';
import 'package:scorbord/models/TeamModel.dart';
import 'package:scorbord/models/local/nba_team.dart';
import 'package:scorbord/pages/games_page.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:scorbord/widgets/SideDrawer.dart';
import 'package:pagination/pagination.dart';
import 'package:share/share.dart';

class GamesDetailsPage extends StatefulWidget {
  const GamesDetailsPage({Key key, @required this.gameID}) : super(key: key);
  final int gameID;
  @override
  State createState() => GamesDetailsPageState(gameID: gameID);
}

class GamesDetailsPageState extends State<GamesDetailsPage> {
  GamesDetailsPageState({@required this.gameID});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final INBAService nbaService = GetIt.I<INBAService>();
  final int gameID;
  final TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white);
  final TextStyle textStyle2 = TextStyle(fontSize: 18, color: Colors.white);

  GameModel game;

  @override
  void initState() {
    super.initState();
  }

  Widget buildTeamWidget({@required TeamModel team, @required int teamScore}) {
    NBATeam nbaTeam = NBATeams.where((nbaTeam) => nbaTeam.id == team.id).first;

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(nbaTeam.imgUrl),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: '${team.abbreviation}', style: textStyle),
              TextSpan(text: '\n$teamScore', style: textStyle2)
            ],
          ),
        )
      ],
    );
  }

  void onPressed() {
    Share.share(
        'Watch this game between ${game.homeTeam.abbreviation} and ${game.visitorTeam.abbreviation}!');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text('Game Details'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: onPressed,
      ),
      body: FutureBuilder(
        future: nbaService.getGame(gameID: gameID),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Spinner();
              break;
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              }

              game = snapshot.data;

              return SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            buildTeamWidget(
                                team: game.homeTeam,
                                teamScore: game.homeTeamScore),
                            buildTeamWidget(
                                team: game.visitorTeam,
                                teamScore: game.visitorTeamScore),
                          ],
                        ),
                      )),
                      height: 300.0,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          image: NetworkImage(
                              'https://cdn.nba.net/nba-drupal-prod/styles/landscape/s3/2018-08/leaguev3.jpeg?itok=j-c6KHL_'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      height: 75,
                      width: screenWidth,
                      child: Center(
                        child: Text(
                          'Quarter: ${game.period}, Status: ${game.status}',
                          style: textStyle,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Share this game with your friends!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
