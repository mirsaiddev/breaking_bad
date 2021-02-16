import '../model/quote.dart';
import 'i_quote_api.dart';
import 'package:breaking_bad/utils/constants.dart';

import 'package:http/http.dart' as _http;

class QuoteApi extends IQuoteApi {
  @override
  Future<List<Quote>> fetchQuotes() async {
    String _url = Constants.QUOTES_API;

    var _response = await _http.get(_url);

    if (_response.statusCode == 200) {
      final _jsonBody = _response.body;

      final _quoteResponse = quoteFromJson(_jsonBody);

      return _quoteResponse;
    } else {
      throw Exception("Failed to get data");
    }
  }
}
