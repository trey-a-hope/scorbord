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
  bool isActive;
  double potAmount;
  DateTime starts;
  DateTime time;
  String userID;

  Game(
      {@required int awayTeamID,
      @required int awayTeamScore,
      @required double betPrice,
      @required int homeTeamID,
      @required int homeTeamScore,
      @required String id,
      @required bool isActive,
      @required double potAmount,
      @required DateTime starts,
      @required int status,
      @required DateTime time,
      @required String userID}) {
    this.awayTeamID = awayTeamID;
    this.awayTeamScore = awayTeamScore;
    this.betPrice = betPrice;
    this.homeTeamID = homeTeamID;
    this.homeTeamScore = homeTeamScore;
    this.id = id;
    this.isActive = isActive;
    this.potAmount = potAmount;
    this.starts = starts;
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
      isActive: data['isActive'],
      potAmount: data['potAmount'],
      starts: data['starts'].toDate(),
      status: data['status'],
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
      'isActive': isActive,
      'potAmount': potAmount,
      'starts': starts,
      'time': time,
      'userID': userID,
    };
  }
}
