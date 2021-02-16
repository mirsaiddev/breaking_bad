import '../model/character.dart';

abstract class ICharacterRepository {
  Future<List<Character>> fetchCharacters();
}
