import '../model/episode.dart';

abstract class IEpisodeRepository{
  Future<List<Episode>> fetchEpisodes();
}