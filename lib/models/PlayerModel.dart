import 'package:flutter/material.dart';

class PlayerModel {
  final int id;
  final String firstName;
  final String lastName;
  final String position;
 
  PlayerModel(
      {@required this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.position});

  factory PlayerModel.fromJSON({@required Map map}) {
    return PlayerModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      position: map['position'],
    );
  }
}
