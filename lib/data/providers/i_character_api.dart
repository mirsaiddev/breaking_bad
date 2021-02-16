import '../model/character.dart';

abstract class ICharacterApi {
  Future<List<Character>> fetchCharecters();
}
