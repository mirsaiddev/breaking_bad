import 'dart:convert';

List<Quote> quoteFromJson(String str) => List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
  Quote({
    this.quoteId,
    this.quote,
    this.author,
    this.series,
  });

  int quoteId;
  String quote;
  String author;
  String series;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        series: json["series"],
      );

  Map<String, dynamic> toJson() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "series": series,
      };
}
