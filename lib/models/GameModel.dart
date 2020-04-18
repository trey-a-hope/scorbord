import 'package:flutter/material.dart';
import 'package:scorbord/models/TeamModel.dart';

class GameModel {
  final int id;
  //final DateTime date;
  final int homeTeamScore;
  final int visitorTeamScore;
  final int season;
  final int period;
  final TeamModel homeTeam;
  final TeamModel visitorTeam;
  final bool postSeason;
  final String status;

// "id":1,
//       "date":"2018-10-16T00:00:00.000Z",
//       "home_team_score":105,
//       "visitor_team_score":87,
//       "season":2018,
//       "period": 4,
//       "status": "Final",
//       "time": " ",
//       "postseason": false,
//       "home_team":{
//         "id":2,
//         "abbreviation":"BOS",
//         "city":"Boston",
//         "conference":"East",
//         "division":"Atlantic",
//         "full_name":"Boston Celtics",
//         "name":"Celtics"
//       },
//       "visitor_team":{
//         "id":23,
//         "abbreviation":"PHI",
//         "city":"Philadelphia",
//         "conference":"East",
//         "division":"Atlantic",
//         "full_name":"Philadelphia 76ers",
//         "name":"76ers"
//       },

  GameModel(
      {@required this.id,
      //@required this.date,
      @required this.homeTeamScore,
      @required this.visitorTeamScore,
      @required this.season,
      @required this.period,
      @required this.homeTeam,
      @required this.visitorTeam,
      @required this.postSeason,
      @required this.status});

  factory GameModel.fromJSON({@required Map map}) {
    return GameModel(
        id: map['id'],
        //date: DateTime(map['date']),
        homeTeamScore: map['home_team_score'],
        visitorTeamScore: map['visitor_team_score'],
        season: map['season'],
        period: map['period'],
        homeTeam: TeamModel.fromJSON(map: map['home_team']),
        visitorTeam: TeamModel.fromJSON(
          map: map['visitor_team'],
        ),
        postSeason: map['postseason'],
        status: map['status']);
  }
}
