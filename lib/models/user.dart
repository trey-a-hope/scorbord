import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String customerId;
  String email;
  String fcmToken;
  String id;
  String imgUrl;
  String firstName;
  String lastName;
  DateTime time;
  String uid;

  User({
      @required String customerId,
      @required String email,
      @required String fcmToken,
      @required String id,
      @required String imgUrl,
      @required bool isSitter,
      @required String name,
      @required String phone,
      @required DateTime time,
      @required String uid}) {
    this.customerId = customerId;
    this.email = email;
    this.fcmToken = fcmToken;
    this.id = id;
    this.imgUrl = imgUrl;
    this.time = time;
    this.uid = uid;
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'email': email,
      'fcmToken': fcmToken,
      'id': id,
      'imgUrl': imgUrl,
      'time': time,
      'uid': uid
    };
  }

  static User extractDocument(DocumentSnapshot ds) {
    return User(
        customerId: ds.data['customerId'],
        email: ds.data['email'],
        fcmToken: ds.data['fcmToken'],
        id: ds.data['id'],
        imgUrl: ds.data['imgUrl'],
        isSitter: ds.data['isSitter'],
        name: ds.data['name'],
        phone: ds.data['phone'],
        time: ds.data['time'].toDate(),
        uid: ds.data['uid']);
  }
}
