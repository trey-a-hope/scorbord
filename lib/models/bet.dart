import 'package:flutter/material.dart';
import 'package:scorbord/protocols.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bet extends ObjectMethods {
  int awayDigit;
  String awayTeam;
  String gameID;
  int homeDigit;
  String homeTeam;
  String id;
  DateTime time;
  String userID;

  Bet(
      {@required int awayDigit,
      @required String awayTeam,
      @required String gameID,
      @required int homeDigit,
      @required String homeTeam,
      @required String id,
      @required DateTime time,
      @required String userID}) {
    this.awayDigit = awayDigit;
    this.awayTeam = awayTeam;
    this.gameID = gameID;
    this.homeDigit = homeDigit;
    this.homeTeam = homeTeam;
    this.id = id;
    this.time = time;
    this.userID = userID;
  }

  static Bet extractDocument(DocumentSnapshot ds) {
    Map<String, dynamic> data = ds.data;
    return Bet(
      awayDigit: data['awayDigit'],
      awayTeam: data['awayTeam'],
      gameID: data['gameID'],
      homeDigit: data['homeDigit'],
      homeTeam: data['homeTeam'],
      id: data['id'],
      time: data['time'],
      userID: data['userID'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'awayDigit': awayDigit,
      'awayTeam': awayTeam,
      'gameID': gameID,
      'homeDigit': homeDigit,
      'homeTeam': homeTeam,
      'id': id,
      'time': time,
      'userID': userID
    };
  }
}
