import 'dart:convert';

List<Episode> episodeFromJson(String str) => List<Episode>.from(json.decode(str).map((x) => Episode.fromJson(x)));

String episodeToJson(List<Episode> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Episode {
  Episode({
    this.episodeId,
    this.title,
    this.season,
    this.airDate,
    this.characters,
    this.episode,
    this.series,
  });

  int episodeId;
  String title;
  String season;
  String airDate;
  List<String> characters;
  String episode;
  String series;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        episodeId: json["episode_id"],
        title: json["title"],
        season: json["season"],
        airDate: json["air_date"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        episode: json["episode"],
        series: json["series"],
      );

  Map<String, dynamic> toJson() => {
        "episode_id": episodeId,
        "title": title,
        "season": season,
        "air_date": airDate,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "episode": episode,
        "series": series,
      };
}
