
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/PlayerModel.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:scorbord/widgets/SideDrawer.dart';
import 'package:pagination/pagination.dart';

class PlayersPage extends StatefulWidget {
  @override
  State createState() => PlayersPageState();
}

class PlayersPageState extends State<PlayersPage> {

  final GetIt getIt = GetIt.I;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int page = 1;
  
  @override
  void initState() {
    super.initState();
  }

  Future<List<PlayerModel>> pageFetch(int offset) async {
    List<PlayerModel> players =
        await getIt<INBAService>().getPlayers(page: page);

    if (players.isEmpty) {
      return List<PlayerModel>();
    }

    page = page + 1;

    return players;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Players'),
        centerTitle: true,
      ),
      drawer: SideDrawer(
        page: 'Players',
      ),
      body: PaginationList<PlayerModel>(
        onLoading: Spinner(),
        onPageLoading: Spinner(),
        separatorWidget: Divider(),
        itemBuilder: (BuildContext context, PlayerModel player) {
          return ListTile(
            title: Text('${player.firstName} ${player.lastName}'),
            subtitle: Text('Position: ${player.position}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('You clicked ${player.firstName} ${player.lastName}!');
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
