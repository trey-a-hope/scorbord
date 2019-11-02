import 'package:flutter/widgets.dart';

class NBATeam {
  String city;
  Color color;
  String conference;
  int id;
  String imgUrl;
  String name;
  String url;
  
  NBATeam({
    @required String city,
    @required Color color,
    @required String conference,
    @required int id,
    @required String imgUrl,
    @required String name,
    @required String url
  }) {
    this.city = city;
    this.color = color;
    this.conference = conference;
    this.id = id;
    this.imgUrl = imgUrl;
    this.name = name;
    this.url = url;
  }
}
