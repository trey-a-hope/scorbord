import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scorbord/common/page_title.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/database/user.dart';
import 'package:scorbord/services/auth.dart';
import 'package:scorbord/services/modal.dart';

class GamesPage extends StatefulWidget {
  @override
  State createState() => GamesPageState();
}

class GamesPageState extends State<GamesPage> {
  final GetIt getIt = GetIt.I;
  User _currentUser;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  _load() async {
    try {
      _currentUser = await getIt<Auth>().getCurrentUser();
      setState(
        () {
          _isLoading = false;
        },
      );
    } catch (e) {
      getIt<Modal>().showAlert(
        context: context,
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PageTitle(title: 'Games'),
        Divider()
      ],
    );
  }
}
