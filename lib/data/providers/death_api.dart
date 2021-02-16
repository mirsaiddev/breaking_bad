import 'package:http/http.dart' as _http;

import '../../utils/constants.dart';
import '../model/death.dart';
import 'i_death_api.dart';

class DeathApi extends IDeathApi {
  @override
  Future<List<Death>> fetchDeaths() async {
    String _url = Constants.DEATHS_API;

    var _response = await _http.get(_url);

    if (_response.statusCode == 200) {
      final _jsonBody = _response.body;

      final _deathResponse = deathFromJson(_jsonBody);

      return _deathResponse;
    } else {
      throw Exception("Failed to get data");
    }
  }
}
