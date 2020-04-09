import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json;

import 'package:scorbord/models/PlayerModel.dart';

abstract class INBAService {
  Future<List<PlayerModel>> getPlayers({@required int page});
  Future<PlayerModel> getPlayer({@required int playerID});
}

class NBAService extends INBAService {
  final String endpoint = 'https://www.balldontlie.io/api/v1/';
  final String authority = 'www.balldontlie.io';
  final String unencodedPath = '/api/v1/';

  @override
  Future<List<PlayerModel>> getPlayers({@required int page}) async {
    Map<String, String> params = {
      'page': '$page',
    };
    Uri uri = Uri.https(authority, '${unencodedPath}players', params);

    http.Response response = await http.get(
      uri,
      headers: {'content-type': 'application/json'},
    );

    try {
      Map bodyMap = json.decode(response.body);
      List<dynamic> playersData = bodyMap['data'];
      List<PlayerModel> players = List<PlayerModel>();
      playersData.forEach((playerData) {
        PlayerModel player = PlayerModel.fromJSON(map: playerData);
        players.add(player);
      });
      return players;
    } catch (e) {
      throw PlatformException(message: e.toString(), code: '');
    }
  }

  @override
  Future<PlayerModel> getPlayer({@required int playerID}) async {
    Uri uri = Uri.https(authority, '${unencodedPath}players/$playerID');

    http.Response response = await http.get(
      uri,
      headers: {'content-type': 'application/json'},
    );

    try {
      Map bodyMap = json.decode(response.body);
      PlayerModel player = PlayerModel.fromJSON(map: bodyMap);
      return player;
    } catch (e) {
      throw PlatformException(message: e.toString(), code: '');
    }
  }
}
