import 'package:flutter/material.dart';

class GameModel {
  final int id;
  // final DateTime date;
  final int homeTeamScore;
  final int visitorTeamScore;
  final int season;

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

  GameModel({
    @required this.id,
    // @required this.date,
    @required this.homeTeamScore,
    @required this.visitorTeamScore,
    @required this.season,
  });

  factory GameModel.fromJSON({@required Map map}) {
    return GameModel(
        id: map['id'],
        // date: DateTime(map['data']),
        homeTeamScore: map['homeTeamScore'],
        visitorTeamScore: map['visitorTeamScore'],
        season: map['season']);
  }
}
