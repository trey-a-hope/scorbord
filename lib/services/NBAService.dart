import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json;

abstract class INBAService {
  Future<Map> getPlayers();
  Future<Map> getPlayer({@required int playerID});
}

class NBAService extends INBAService {
  final String endpoint = 'https://www.balldontlie.io/api/v1/';

  @override
  Future<Map> getPlayers() async {
    http.Response response = await http.get(
      '${endpoint}players',
      headers: {'content-type': 'application/json'},
    );

    try {
      Map bodyMap = json.decode(response.body);
      List<dynamic> dataMap = bodyMap['data'];

      Map s;
      for(var i = 0; i < dataMap.length; i++){
        s = dataMap[i];
      }
      return s;
    } catch (e) {
      throw PlatformException(message: e.toString(), code: '');
    }
  }

  @override
  Future<Map> getPlayer({@required int playerID}) async {
    http.Response response = await http.get(
      '${endpoint}players/$playerID',
      headers: {'content-type': 'application/json'},
    );

    try {
      Map bodyMap = json.decode(response.body);

      return bodyMap;
      // if (map['statusCode'] == null) {
      //   return map['id'];
      // } else {
      //   throw PlatformException(
      //       message: map['raw']['message'], code: map['raw']['code']);
      // }
    } catch (e) {
      throw PlatformException(message: e.toString(), code: '');
    }
  }
}
