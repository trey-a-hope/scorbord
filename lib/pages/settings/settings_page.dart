import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scorbord/common/page_title.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/database/user.dart';
import 'package:scorbord/services/auth.dart';
import 'package:scorbord/services/modal.dart';

class SettingsPage extends StatefulWidget {
  @override
  State createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
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
        PageTitle(title: 'Settings'),
        Divider(),
        _deleteAccount(),
        Divider(),
        _admin(),
        Divider(),
        _signOut(),
        Divider()
      ],
    );
  }

  ListTile _deleteAccount() {
    return ListTile(
      leading: Icon(
        MdiIcons.delete,
        color: Colors.white,
      ),
      title: Text(
        'Delete Account',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0),
      ),
      subtitle: Text(
        'Remove account from this app.',
        style: TextStyle(color: Colors.grey.shade200),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // bool confirm = await getIt<Modal>().showConfirmation(
        //     context: context,
        //     title: 'Delete Account',
        //     message: 'Are you sure?');
        // if (confirm) {
        //   try {
        //     await getIt<Auth>().deleteUser(userID: _currentUser.id);
        //     Navigator.popUntil(
        //       context,
        //       ModalRoute.withName(Navigator.defaultRouteName),
        //     );
        //   } catch (e) {
        //     getIt<Modal>().showAlert(
        //       context: context,
        //       title: 'Error',
        //       message: e.toString(),
        //     );
        //   }
        // }
      },
    );
  }

  ListTile _admin() {
    return ListTile(
      leading: Icon(
        MdiIcons.account,
        color: Colors.white,
      ),
      title: Text(
        'Admin',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0),
      ),
      subtitle: Text(
        'Approve messages, update games, etc.',
        style: TextStyle(color: Colors.grey.shade200),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  ListTile _signOut() {
    return ListTile(
      leading: Icon(
        MdiIcons.logout,
        color: Colors.white,
      ),
      title: Text(
        'Sign Out',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0),
      ),
      subtitle: Text(
        'Log out temporarily.',
        style: TextStyle(color: Colors.grey.shade200),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
