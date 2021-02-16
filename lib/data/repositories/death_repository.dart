import '../model/death.dart';
import '../providers/i_death_api.dart';
import 'i_death_repository.dart';

class DeathRepository extends IDeathRepository {
  final IDeathApi deathApi;

  DeathRepository({this.deathApi});
  @override
  Future<List<Death>> fetchDeaths() {
    Future<List<Death>> deaths = deathApi.fetchDeaths();
    return deaths;
  }
}
