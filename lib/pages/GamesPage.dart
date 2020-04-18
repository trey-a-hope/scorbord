import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scorbord/common/spinner.dart';
import 'package:scorbord/models/GameModel.dart';
import 'package:scorbord/pages/GameDetailsPage.dart';
import 'package:scorbord/services/NBAService.dart';
import 'package:scorbord/widgets/SideDrawer.dart';
import 'package:pagination/pagination.dart';

class GamesPage extends StatefulWidget {
  @override
  State createState() => GamesPageState();
}

class GamesPageState extends State<GamesPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final INBAService nbaService = GetIt.I<INBAService>();

  int page = 1;
  bool endPageFetch = false;

  @override
  void initState() {
    super.initState();
  }

  Future<List<GameModel>> pageFetch(int offset) async {
    if (!endPageFetch) {
      List<GameModel> games = await nbaService.getGames(page: page);

      if (games.isEmpty) endPageFetch = true;

      page = page + 1;

      return games;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Games'),
        centerTitle: true,
      ),
      drawer: SideDrawer(
        page: 'Games',
      ),
      body: PaginationList<GameModel>(
        onLoading: Spinner(),
        onPageLoading: Spinner(),
        separatorWidget: Divider(),
        itemBuilder: (BuildContext context, GameModel game) {
          return ListTile(
            title: Text('ID: ${game.id}'),
            subtitle: Text('Season: ${game.season}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GamesDetailsPage(
                    gameID: game.id,
                  ),
                ),
              );
            },
          );
        },
        pageFetch: pageFetch,
        onError: (dynamic error) => Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(error.toString()),
          ),
        ),
        onEmpty: Center(
          child: Text('Empty List'),
        ),
      ),
    );
  }
}
