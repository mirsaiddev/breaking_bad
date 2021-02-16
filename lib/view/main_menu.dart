import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../utils/constants.dart';
import 'pages/characters_page.dart';
import 'pages/deaths_page.dart';
import 'pages/episodes_page.dart';
import 'pages/quotes_page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  dynamic _buildPage() {
    if (_currentIndex == 0) {
      return CharactersPage();
    } else if (_currentIndex == 1) {
      return EpisodesPage();
    } else if (_currentIndex == 2) {
      return QuotesPage();
    } else if (_currentIndex == 3) {
      return DeathsPage();
    }
  }

  SalomonBottomBar _buildBottomNavigationBar() {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Characters"),
          selectedColor: Constants.DarkGreen,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.movie),
          title: Text("Episodes"),
          selectedColor: Constants.ForestGreen,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.format_quote),
          title: Text("Quotes"),
          selectedColor: Constants.SeaGreen,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.close_outlined),
          title: Text("Deaths"),
          selectedColor: Constants.SeaGreen,
        ),
      ],
    );
  }
}
