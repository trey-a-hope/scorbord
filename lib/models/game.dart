import 'package:flutter/material.dart';
import 'package:scorbord/protocols.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Game extends ObjectMethods {
  int awayTeamID;
  int awayTeamScore;
  double betPrice;
  int homeTeamID;
  int homeTeamScore;
  String id;
  double potAmount;
  DateTime starts;
  int status;
  bool taken;
  DateTime time;
  String userID;

  Game(
      {@required int awayTeamID,
      @required int awayTeamScore,
      @required double betPrice,
      @required int homeTeamID,
      @required int homeTeamScore,
      @required String id,
      @required double potAmount,
      @required DateTime starts,
      @required int status,
      @required bool taken,
      @required DateTime time,
      @required String userID}) {
    this.awayTeamID = awayTeamID;
    this.awayTeamScore = awayTeamScore;
    this.betPrice = betPrice;
    this.homeTeamID = homeTeamID;
    this.homeTeamScore = homeTeamScore;
    this.id = id;
    this.potAmount = potAmount;
    this.starts = starts;
    this.status = status;
    this.taken = taken;
    this.time = time;
    this.userID = userID;
  }

  static Game extractDocument(DocumentSnapshot ds) {
    Map<String, dynamic> data = ds.data;
    return Game(
      awayTeamID: data['awayTeamID'],
      awayTeamScore: data['awayTeamScore'],
      betPrice: data['betPrice'],
      homeTeamID: data['homeTeamID'],
      homeTeamScore: data['homeTeamScore'],
      id: data['id'],
      potAmount: data['potAmount'],
      starts: data['starts'].toDate(),
      status: data['status'],
      taken: data['taken'],
      time: data['time'].toDate(),
      userID: data['userID'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'awayTeamID': awayTeamID,
      'awayTeamScore': awayTeamScore,
      'betPrice': betPrice,
      'homeTeamID': homeTeamID,
      'homeTeamScore': homeTeamScore,
      'id': id,
      'potAmount': potAmount,
      'starts': starts,
      'status': status,
      'taken': taken,
      'time': time,
      'userID': userID,
    };
  }
}
