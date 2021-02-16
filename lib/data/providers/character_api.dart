import 'package:http/http.dart' as _http;

import '../../utils/constants.dart';
import '../model/character.dart';
import 'i_character_api.dart';

class CharacterApi extends ICharacterApi {
  @override
  Future<List<Character>> fetchCharecters() async {
    final String _url = Constants.ALL_CHARACTERS_API;
    var _response = await _http.get(_url);

    if (_response.statusCode == 200) {
      final _jsonBody = _response.body;

      final _characterResponse = characterFromJson(_jsonBody);

      return _characterResponse;
    } else {
      throw Exception("Failed to get data");
    }
  }
}
