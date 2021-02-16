import '../model/quote.dart';

abstract class IQuoteApi {
  Future<List<Quote>> fetchQuotes();
}
