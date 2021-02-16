import 'package:flutter/material.dart';

import '../data/model/character.dart';
import '../data/providers/character_api.dart';
import '../data/repositories/character_repository.dart';

enum CharacterState { INITIAL, LOADING, COMPLETED }

class CharacterViewModel extends ChangeNotifier {
  CharacterRepository _characterRepository;

  CharacterViewModel() {
    _characterRepository = CharacterRepository(characterApi: CharacterApi());
  }

  List<Character> _characterList;
  List<Character> get characterList => _characterList;

  CharacterState _characterState = CharacterState.INITIAL;
  CharacterState get characterState => _characterState;

  void _setCharacterState(CharacterState characterState) {
    _characterState = characterState;
    notifyListeners();
  }

  Future<void> fetchCharacters() async {
    _setCharacterState(CharacterState.LOADING);
    _characterList = await _characterRepository.fetchCharacters();
    _setCharacterState(CharacterState.COMPLETED);
  }
}
