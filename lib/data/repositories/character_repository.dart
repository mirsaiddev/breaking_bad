import '../model/character.dart';
import '../providers/character_api.dart';
import '../providers/i_character_api.dart';
import 'i_character_repository.dart';

class CharacterRepository extends ICharacterRepository {
  final ICharacterApi characterApi;

  CharacterRepository({this.characterApi});

  @override
  Future<List<Character>> fetchCharacters() {
    Future<List<Character>> characters = CharacterApi().fetchCharecters();
    return characters;
  }
}
