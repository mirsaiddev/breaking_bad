import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/constants.dart';
import 'view/main_menu.dart';
import 'view_model/character_view_model.dart';
import 'view_model/deaths_view_model.dart';
import 'view_model/episode_view_model.dart';
import 'view_model/quotes_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuoteViewModel()..fetchQuotes(),
        ),
        ChangeNotifierProvider(
          create: (context) => CharacterViewModel()..fetchCharacters(),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeViewModel()..fetchEpisodes(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeathViewModel()..fetchQuotes(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Constants.ForestGreen, primarySwatch: Colors.green),
      home: MainMenu(),
    );
  }
}
