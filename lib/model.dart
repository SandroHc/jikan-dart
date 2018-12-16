
import 'package:json_annotation/json_annotation.dart';

/// Rebuild with command: flutter packages pub run build_runner build
part 'model.g.dart';


abstract class MalBase {
  int malId;
  Uri url;

  MalBase({this.malId, this.url});
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Anime extends MalBase {
  final Uri imageUrl;
  final Uri trailerUrl;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  // episodes
  final String status;
  final bool airing;
  final AnimeAired aired;

  @JsonKey(fromJson: _durationFrom, toJson: _durationTo)
  final Duration duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String background;
  final String premiered;
  final String broadcast;
  final Map<String, List<Anime>> related;
  final List<Company> producers;
  final List<Company> licensors;
  final List<Company> studios;
  final List<Genre> genres;
  final List<String> openingThemes;
  final List<String> endingThemes;

  final List<Character> characters;


  Anime({this.related, this.producers, this.licensors, this.studios, this.titleSynonyms, this.type,
      this.source, this.status, this.airing, this.aired, this.duration, this.rating, this.score,
      this.scoredBy, this.popularity, this.members, this.favorites, this.synopsis, this.background,
      this.premiered, this.broadcast, this.genres, this.openingThemes, this.endingThemes, this.characters,
      this.imageUrl, this.trailerUrl, this.title, this.titleEnglish, this.titleJapanese});

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeToJson(this);

  /// Expected format: "1 hr 59 min"
  static Duration _durationFrom(String str) {
    RegExp exp = new RegExp(r"((\d+) hr)?\s?((\d+) min)?");
    Match match = exp.firstMatch(str);

    int hours = int.tryParse(match?.group(2) ?? "") ?? 0;
    int minutes = int.tryParse(match?.group(4) ?? "") ?? 0;
    return Duration(hours: hours, minutes: minutes);
  }

  static String _durationTo(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes - (hours * Duration.minutesPerHour);

    String str;
    if(hours > 0) {
      str += hours.toString() + " hr ";
    }
    return str + minutes.toString() + " min";
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeAired {
  final DateTime from;
  final DateTime to;


  AnimeAired({this.from, this.to});

  factory AnimeAired.fromJson(Map<String, dynamic> json) => _$AnimeAiredFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeAiredToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre extends MalBase {
  final String type;
  final String name;


  Genre({this.type, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Character extends MalBase {
  final Uri imageUrl;
  final String name;
  final String role;
  final List<VoiceActor> voice_actors;


  Character({this.imageUrl, this.name, this.role, this.voice_actors});

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Company extends MalBase {
  final String type;
  final String name;


  Company({this.type, this.name});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Person extends MalBase {
  final String name;
  final Uri imageUrl;


  Person({this.name, this.imageUrl});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class VoiceActor extends Person {
  final String language;


  VoiceActor({this.language});

  factory VoiceActor.fromJson(Map<String, dynamic> json) => _$VoiceActorFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Staff extends Person {
  final List<String> positions;


  Staff({this.positions});

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  Map<String, dynamic> toJson() => _$StaffToJson(this);
}