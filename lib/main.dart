import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/constants.dart';
import 'package:scorbord/pages/HomePage.dart';
import 'package:scorbord/pages/PlayersPage.dart';
import 'package:scorbord/pages/exampleWidget.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:scorbord/services/auth.dart';
import 'package:scorbord/services/db.dart';
import 'package:scorbord/services/fcm_notification.dart';
import 'package:scorbord/services/modal.dart';
import 'package:scorbord/services/validator.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'dart:io';

// This is our global ServiceLocator
final GetIt getIt = GetIt.instance;

void main() async {
  //Widgets Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

//Register services.
  getIt.registerSingleton<DB>(DBImplementation(), signalsReady: true);
  getIt.registerSingleton<FCMNotification>(FCMNotificationImplementation(),
      signalsReady: true);
  getIt.registerSingleton<Modal>(ModalImplementation(), signalsReady: true);
  getIt.registerSingleton<Validator>(ValidatorImplementation(),
      signalsReady: true);
  getIt.registerSingleton<Auth>(AuthImplementation(), signalsReady: true);
  getIt.registerSingleton<INBAService>(NBAService(), signalsReady: true);

  //Assign app version and build number.
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  version = packageInfo.version;
  buildNumber = packageInfo.buildNumber;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scorbord',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
