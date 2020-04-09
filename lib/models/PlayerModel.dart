import 'package:flutter/material.dart';

class PlayerModel {
  final String firstName;
  final String lastName;
  final String position;

  PlayerModel(
      {@required this.firstName,
      @required this.lastName,
      @required this.position});

  factory PlayerModel.fromJSON({@required Map map}) {
    return PlayerModel(
      firstName: map['first_name'],
      lastName: map['last_name'],
      position: map['position'],
    );
  }
}
