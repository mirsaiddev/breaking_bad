import 'package:http/http.dart' as _http;

import '../../utils/constants.dart';
import '../model/episode.dart';
import 'i_episode_api.dart';

class EpisodeApi extends IEpisodeApi {
  @override
  Future<List<Episode>> fetchEpisodes() async {
    String _url = Constants.ALL_EPISODES_API;

    var _response = await _http.get(_url);

    if (_response.statusCode == 200) {
     
      final _jsonBody = _response.body;

      final _episodeResponse = episodeFromJson(_jsonBody);

      return _episodeResponse;
    } else {
      throw Exception("Failed to get data");
    }
  }
}
