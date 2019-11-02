import 'package:flutter/material.dart';
import 'package:scorbord/protocols.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bet extends ObjectMethods {
  int awayDigit;
  int homeDigit;
  String id;
  DateTime time;
  String userID;

  Bet(
      {@required int awayDigit,
      @required int homeDigit,
      @required String id,
      @required DateTime time,
      @required String userID}) {
    this.awayDigit = awayDigit;
    this.homeDigit = homeDigit;
    this.id = id;
    this.time = time;
    this.userID = userID;
  }

  static Bet extractDocument(DocumentSnapshot ds) {
    Map<String, dynamic> data = ds.data;
    return Bet(
      awayDigit: data['awayDigit'],
      homeDigit: data['homeDigit'],
      id: data['id'],
      time: data['time'],
      userID: data['userID'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'awayDigit': awayDigit,
      'homeDigit': homeDigit,
      'id': id,
      'time': time,
      'userID': userID
    };
  }
}
