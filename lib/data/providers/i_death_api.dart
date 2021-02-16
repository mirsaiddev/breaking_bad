import '../model/death.dart';

abstract class IDeathApi {
  Future<List<Death>> fetchDeaths();
}
