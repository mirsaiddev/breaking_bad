import '../model/episode.dart';

abstract class IEpisodeApi {
  Future<List<Episode>> fetchEpisodes();
}
