import '../model/episode.dart';
import '../providers/episode_api.dart';
import '../providers/i_episode_api.dart';
import 'i_episode_repository.dart';

class EpisodeRepository extends IEpisodeRepository {
  final IEpisodeApi episodeApi;

  EpisodeRepository({this.episodeApi});
  @override
  Future<List<Episode>> fetchEpisodes() {
    Future<List<Episode>> episodes = EpisodeApi().fetchEpisodes();
    return episodes;
  }
}
