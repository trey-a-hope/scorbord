import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/PlayerModel.dart';
import 'package:scorbord/models/TeamModel.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:scorbord/widgets/SideDrawer.dart';
import 'package:pagination/pagination.dart';

class TeamsPage extends StatefulWidget {
  @override
  State createState() => TeamsPageState();
}

class TeamsPageState extends State<TeamsPage> {
  final GetIt getIt = GetIt.I;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int page = 1;
  bool endPageFetch = false;
  @override
  void initState() {
    super.initState();
  }

  Future<List<TeamModel>> pageFetch(int offset) async {
    if (!endPageFetch) {
      List<TeamModel> teams = await getIt<INBAService>().getTeams(page: page);

      if (teams.isEmpty) endPageFetch = true;

      page = page + 1;

      return teams;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Teams'),
        centerTitle: true,
      ),
      drawer: SideDrawer(
        page: 'Teams',
      ),
      body: PaginationList<TeamModel>(
        onLoading: Spinner(),
        onPageLoading: Spinner(),
        separatorWidget: Divider(),
        itemBuilder: (BuildContext context, TeamModel team) {
          return ListTile(
            title: Text('${team.fullName}'),
            subtitle: Text('Division: ${team.division}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('You clicked ${team.fullName}!');
            },
          );
        },
        pageFetch: pageFetch,
        onError: (dynamic error) => Center(
          child: Text('Something Went Wrong'),
        ),
        onEmpty: Center(
          child: Text('Empty List'),
        ),
      ),
    );
  }
}
