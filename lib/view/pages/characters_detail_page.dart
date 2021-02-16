import 'package:flutter/material.dart';

import '../../data/model/character.dart';
import '../../utils/constants.dart';

class CharactersDetailPage extends StatefulWidget {
  final Character character;

  const CharactersDetailPage({Key key, @required this.character}) : super(key: key);
  @override
  _CharactersDetailPageState createState() => _CharactersDetailPageState();
}

class _CharactersDetailPageState extends State<CharactersDetailPage> {
  @override
  Widget build(BuildContext context) {
    Character _character = widget.character;
    return SafeArea(
      child: Scaffold(body: _buildPage(_character)),
    );
  }

  SingleChildScrollView _buildPage(Character _character) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(_character.img),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSpace(10),
              _buildNameAndNick(_character.name, _character.nickname),
              _buildPortrayed(_character.portrayed),
              _buildSpace(10),
              _buildInfoCard("Occupation", _character.occupation.toString()),
              _buildInfoCard("Category", _character.category),
              _buildInfoCard("Status", _character.status),
              _buildInfoCard("Birthday", _character.birthday),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildInfoCard(String key, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Text("$key :  $value"),
    );
  }

  Center _buildPortrayed(String text) {
    return Center(child: Text(text, style: TextStyle(color: Colors.grey[600])));
  }

  Center _buildNameAndNick(String name, nickname) {
    return Center(child: Text("$name - $nickname", style: Constants.HEADING1));
  }

  SizedBox _buildSpace(double value) {
    return SizedBox(height: value);
  }

  Container _buildImage(String img) {
    return Container(
      color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Image.network(img),
      ),
    );
  }
}
