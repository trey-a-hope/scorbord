import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/pages/holder.dart';
import 'package:scorbord/services/auth.dart';
import 'package:scorbord/services/db.dart';
import 'package:scorbord/services/fcm_notification.dart';
import 'package:scorbord/services/modal.dart';
import 'package:scorbord/services/validator.dart';

// This is our global ServiceLocator
final GetIt getIt = GetIt.instance;

void main() {

  //Widgets Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<Auth>(AuthImplementation(), signalsReady: true);
  getIt.registerSingleton<DB>(DBImplementation(), signalsReady: true);
  getIt.registerSingleton<FCMNotification>(FCMNotificationImplementation(),
      signalsReady: true);
  getIt.registerSingleton<Modal>(ModalImplementation(), signalsReady: true);
  getIt.registerSingleton<Validator>(ValidatorImplementation(),
      signalsReady: true);

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
      home: Holder(),
    );
  }
}
