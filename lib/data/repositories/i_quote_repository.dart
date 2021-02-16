import '../model/quote.dart';

abstract class IQuotesRepostitory {
  Future<List<Quote>> fetchQuotes();
}
