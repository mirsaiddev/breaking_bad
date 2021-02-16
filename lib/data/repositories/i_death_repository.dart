import '../model/death.dart';

abstract class IDeathRepository {
  Future<List<Death>> fetchDeaths();
}
