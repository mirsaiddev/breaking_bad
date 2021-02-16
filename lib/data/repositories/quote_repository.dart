import '../model/quote.dart';
import '../providers/i_quote_api.dart';
import '../providers/quote_api.dart';
import 'i_quote_repository.dart';

class QuoteRepository extends IQuotesRepostitory {
  final IQuoteApi quoteApi;

  QuoteRepository({this.quoteApi});
  @override
  Future<List<Quote>> fetchQuotes() {
    Future<List<Quote>> quotes = QuoteApi().fetchQuotes();
    return quotes;
  }
}
