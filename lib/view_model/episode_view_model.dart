import 'package:flutter/cupertino.dart';

import '../data/model/episode.dart';
import '../data/providers/episode_api.dart';
import '../data/repositories/episode_repository.dart';

enum EpisodeState { INITIAL, LOADING, COMPLETE }

class EpisodeViewModel with ChangeNotifier {
  EpisodeRepository _episodeRepository;

  EpisodeViewModel() {
    _episodeRepository = EpisodeRepository(episodeApi: EpisodeApi());
  }

  List<Episode> _episodesList;
  List<Episode> get episodeList => _episodesList;

  EpisodeState _episodeState = EpisodeState.INITIAL;
  EpisodeState get episodeState => _episodeState;

  _setEpisodeState(EpisodeState episodeState) {
    _episodeState = episodeState;
    notifyListeners();
  }

  Future<void> fetchEpisodes() async {
    _setEpisodeState(EpisodeState.LOADING);
    _episodesList = await _episodeRepository.fetchEpisodes();
    _setEpisodeState(EpisodeState.COMPLETE);
  }
}
