import 'package:flutter/material.dart';

import '../data/model/quote.dart';
import '../data/providers/quote_api.dart';
import '../data/repositories/quote_repository.dart';

enum QuoteState { INITIAL, LOADING, COMPLETED }

class QuoteViewModel with ChangeNotifier {
  QuoteRepository _quoteRepository;

  QuoteViewModel() {
    _quoteRepository = QuoteRepository(quoteApi: QuoteApi());
  }

  List<Quote> _quotesList;
  List<Quote> get quotesList => _quotesList;

  QuoteState _quoteState = QuoteState.INITIAL;
  QuoteState get quoteState => _quoteState;

  void _setQuotesState(QuoteState quoteState) {
    _quoteState = quoteState;
    notifyListeners();
  }

  Future<void> fetchQuotes() async {
    _setQuotesState(QuoteState.LOADING);
    _quotesList = await _quoteRepository.fetchQuotes();
    _setQuotesState(QuoteState.COMPLETED);
  }
}
