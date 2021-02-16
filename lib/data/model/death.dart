// To parse this JSON data, do
//
//     final death = deathFromJson(jsonString);

import 'dart:convert';

List<Death> deathFromJson(String str) => List<Death>.from(json.decode(str).map((x) => Death.fromJson(x)));

String deathToJson(Death data) => json.encode(data.toJson());

class Death {
  Death({
    this.deathId,
    this.death,
    this.cause,
    this.responsible,
    this.lastWords,
    this.season,
    this.episode,
    this.numberOfDeaths,
  });

  int deathId;
  String death;
  String cause;
  String responsible;
  String lastWords;
  int season;
  int episode;
  int numberOfDeaths;

  factory Death.fromJson(Map<String, dynamic> json) => Death(
        deathId: json["death_id"],
        death: json["death"],
        cause: json["cause"],
        responsible: json["responsible"],
        lastWords: json["last_words"],
        season: json["season"],
        episode: json["episode"],
        numberOfDeaths: json["number_of_deaths"],
      );

  Map<String, dynamic> toJson() => {
        "death_id": deathId,
        "death": death,
        "cause": cause,
        "responsible": responsible,
        "last_words": lastWords,
        "season": season,
        "episode": episode,
        "number_of_deaths": numberOfDeaths,
      };
}
