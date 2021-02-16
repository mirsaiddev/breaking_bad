import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/character.dart';
import '../../utils/constants.dart';
import '../../view_model/character_view_model.dart';
import 'characters_detail_page.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: _buildConsumer());
  }

  Consumer<CharacterViewModel> _buildConsumer() {
    return Consumer<CharacterViewModel>(builder: (context, model, child) {
      if (model.characterState == CharacterState.INITIAL) {
        return _buildInitial();
      } else if (model.characterState == CharacterState.LOADING) {
        return _buildLoading();
      } else {
        return _buildSuccess(model.characterList);
      }
    });
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Constants.JapaneseLaurel),
      ),
    );
  }

  Center _buildInitial() {
    return Center(
      child: Text('Initial'),
    );
  }

  Padding _buildSuccess(List<Character> _characters) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GridView.builder(
        itemCount: _characters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          Character _character = _characters[index];
          return _buildCharacterCard(_character);
        },
      ),
    );
  }

  GestureDetector _buildCharacterCard(Character _character) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CharactersDetailPage(character: _character)));
      },
      child: Column(
        children: [
          _buildImage(_character.img),
          _buildName(_character.name),
        ],
      ),
    );
  }

  Expanded _buildImage(String img) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: img,
            fit: BoxFit.cover,
            width: 200,
          ),
        ),
      ),
    );
  }

  Expanded _buildName(String name) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Constants.ForestGreen, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
