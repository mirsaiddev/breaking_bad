import 'package:flutter/material.dart';

import '../data/model/death.dart';
import '../data/providers/death_api.dart';
import '../data/repositories/death_repository.dart';

enum DeathState { INITIAL, LOADING, COMPLETED }

class DeathViewModel with ChangeNotifier {
  DeathRepository _quoteRepository;

  DeathViewModel() {
    _quoteRepository = DeathRepository(deathApi: DeathApi());
  }

  List<Death> _deathsList;
  List<Death> get deathsList => _deathsList;

  DeathState _deathState = DeathState.INITIAL;
  DeathState get deathState => _deathState;

  void _setQuotesState(DeathState deathState) {
    _deathState = deathState;
    notifyListeners();
  }

  Future<void> fetchQuotes() async {
    _setQuotesState(DeathState.LOADING);
    _deathsList = await _quoteRepository.fetchDeaths();
    _setQuotesState(DeathState.COMPLETED);
  }
}
