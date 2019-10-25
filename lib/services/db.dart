import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scorbord/models/bet.dart';
import 'package:scorbord/models/game.dart';
import 'package:scorbord/models/user.dart';

abstract class DB {
  //Bets
  Future<void> createBet({@required String gameID, @required Bet bet});
  Future<void> deleteBet({@required String gameID, @required String betID});
  Future<Bet> retrieveBet({@required String gameID, @required String betID});
  Future<void> updateBet(
      {@required String gameID,
      @required String betID,
      @required Map<String, dynamic> data});

//Games
  Future<void> createGame({@required Game game});
  Future<void> deleteGame({@required String gameID});
  Future<Game> retrieveGame({@required String gameID});
  Future<void> updateGame(
      {@required String gameID, @required Map<String, dynamic> data});

  //Users
  Future<void> createUser({@required User user});
  Future<void> deleteUser({@required String userID});
  Future<User> retrieveUser({@required String userID});
  Future<void> updateUser(
      {@required String userId, @required Map<String, dynamic> data});
}

class DBImplementation extends DB {
  final CollectionReference _usersDB = Firestore.instance.collection('Users');
  final CollectionReference _gamesDB = Firestore.instance.collection('Games');

  @override
  Future<User> retrieveUser({@required String userID}) async {
    try {
      DocumentSnapshot documentSnapshot = await _usersDB.document(userID).get();
      return User.extractDocument(documentSnapshot);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> createUser({User user}) async {
    try {
      DocumentReference docRef = await _usersDB.add(
        user.toMap(),
      );
      await _usersDB
          .document(docRef.documentID)
          .updateData({'id': docRef.documentID});
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> updateUser(
      {@required String userId, @required Map<String, dynamic> data}) async {
    try {
      await _usersDB.document(userId).updateData(data);
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> createBet({String gameID, Bet bet}) async {
    try {
      final CollectionReference _betsColRef =
          _gamesDB.document(gameID).collection('Bets');
      DocumentReference docRef = await _betsColRef.add(bet.toMap());
      await _betsColRef
          .document(docRef.documentID)
          .updateData({'id': docRef.documentID});
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> deleteUser({String userID}) async {
    try {
      await _usersDB.document(userID).delete();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> deleteBet({String gameID, String betID}) async {
    try {
      final CollectionReference _betsColRef =
          _gamesDB.document(gameID).collection('Bets');
      await _betsColRef.document(betID).delete();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> createGame({Game game}) async {
    try {
      DocumentReference docRef = await _gamesDB.add(game.toMap());
      await _gamesDB
          .document(docRef.documentID)
          .updateData({'id': docRef.documentID});
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> deleteGame({String gameID}) async {
    try {
      await _gamesDB.document(gameID).delete();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<Bet> retrieveBet({String gameID, String betID}) async {
    try {
      final CollectionReference _betsColRef =
          _gamesDB.document(gameID).collection('Bets');
      DocumentSnapshot documentSnapshot =
          await _betsColRef.document(betID).get();
      return Bet.extractDocument(documentSnapshot);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<Game> retrieveGame({String gameID}) async {
    try {
      DocumentSnapshot documentSnapshot = await _gamesDB.document(gameID).get();
      return Game.extractDocument(documentSnapshot);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> updateBet(
      {String gameID, String betID, Map<String, dynamic> data}) async {
    try {
      final CollectionReference _betsColRef =
          _gamesDB.document(gameID).collection('Bets');
      await _betsColRef.document(betID).updateData(data);
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> updateGame({String gameID, Map<String, dynamic> data}) async {
    try {
      await _gamesDB.document(gameID).updateData(data);
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
