import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scorbord/common/page_title.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/database/user.dart';
import 'package:scorbord/services/auth.dart';
import 'package:scorbord/services/modal.dart';
import 'package:scorbord/services/validator.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final GetIt getIt = GetIt.I;
  User _currentUser;
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

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
        PageTitle(
          title: 'Search',
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[_searchField()],
          ),
        )
      ],
    );
  }

  Widget _searchField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: _searchController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      maxLengthEnforced: true,
      // maxLength: MyFormData.nameCharLimit,
      onFieldSubmitted: (term) {},
      validator: getIt<Validator>().email,
      onSaved: (value) {},
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: 'Enter team name...',
        hintStyle: TextStyle(color: Colors.white),
        hoverColor: Colors.white,
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        fillColor: Colors.white,
      ),
    );
  }
}
