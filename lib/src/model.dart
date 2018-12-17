
import 'package:json_annotation/json_annotation.dart';

/// Rebuild with command: flutter packages pub run build_runner build
part 'package:jikan/src/model.g.dart';


abstract class MalBase {
  int malId;
  Uri url;

  MalBase({this.malId, this.url});
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MalStats {
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;
  final int total;
  final Map<String, MalScore> scores;

  MalStats({this.watching, this.completed, this.onHold, this.dropped,
      this.planToWatch, this.total, this.scores});

  factory MalStats.fromJson(Map<String, dynamic> json) => _$MalStatsFromJson(json);
  Map<String, dynamic> toJson() => _$MalStatsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MalScore {
  final int votes;
  final double percentage;

  MalScore({this.votes, this.percentage});

  factory MalScore.fromJson(Map<String, dynamic> json) => _$MalScoreFromJson(json);
  Map<String, dynamic> toJson() => _$MalScoreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MalForum {
  final List<MalForumTopic> topics;

  MalForum({this.topics});

  factory MalForum.fromJson(Map<String, dynamic> json) => _$MalForumFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MalForumTopicPost {
  final Uri url;
  final String authorName;
  final Uri authorUrl;
  final DateTime datePosted;

  MalForumTopicPost({this.url, this.authorName, this.authorUrl, this.datePosted});

  factory MalForumTopicPost.fromJson(Map<String, dynamic> json) => _$MalForumTopicPostFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumTopicPostToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MalForumTopic extends MalForumTopicPost {
  final int topicId;
  final String title;
  final int replies;
  final MalForumTopicPost lastPost;

  MalForumTopic({this.topicId, this.title, this.replies, this.lastPost});

  factory MalForumTopic.fromJson(Map<String, dynamic> json) => _$MalForumTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumTopicToJson(this);
}

/// Endpoint: /anime/<id>
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
  final int episodes;
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
  @JsonKey(fromJson: _licensorsFrom)
  final List<Company> licensors;
  final List<Company> studios;
  final List<Genre> genres;
  final List<String> openingThemes;
  final List<String> endingThemes;

  final bool r18; // Seen in the schedule
  final bool kids; // Seen in the schedule

  /// Endpoint: /anime/<id>/characters_staff
  final Characters characters;

  /// Endpoint: /anime/<id>/news
  final Articles articles;

  /// Endpoint: /anime/<id>/episodes/<?page>
  final AnimeEpisodes episodeList;

  /// Endpoint: /anime/<id>/pictures
  final Pictures pictures;

  /// Endpoint: /anime/<id>/videos
  final Map<String, List<Video>> videos;

  /// Endpoint: /anime/<id>/stats
  final MalStats stats;

  /// Endpoint: /anime/<id>/forum
  final MalForum forum;

  /// Endpoint: /anime/<id>/moreinfo
  final MalForum moreInfo;


  Anime({this.related, this.producers, this.licensors, this.studios, this.titleSynonyms, this.type,
      this.source, this.status, this.airing, this.aired, this.duration, this.rating, this.score,
      this.scoredBy, this.popularity, this.members, this.favorites, this.synopsis, this.background,
      this.premiered, this.broadcast, this.genres, this.openingThemes, this.endingThemes, this.characters,
      this.imageUrl, this.trailerUrl, this.title, this.titleEnglish, this.titleJapanese, this.articles,
      this.episodes, this.pictures, this.videos, this.r18, this.kids, this.stats, this.forum, this.moreInfo,
      this.episodeList});

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

  static List<Company> _licensorsFrom(List<dynamic> response) {
    return response.map((val) => val is String ? Company(name: val) : Company.fromJson(val)).toList();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeEpisodes {
  final int episodesLastPage;
  final List<AnimeEpisode> episodes;

  AnimeEpisodes({this.episodesLastPage, this.episodes});

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) => _$AnimeEpisodesFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEpisodesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeEpisode {
  final int episodeId;
  final String title;
  final String titleJapanese;
  final String titleRomanji;
  final AnimeAired aired;
  final bool filler;
  final bool recap;
  final Uri videoUrl;
  final Uri forumUrl;

  AnimeEpisode({this.episodeId, this.title, this.titleJapanese,
      this.titleRomanji, this.aired, this.filler, this.recap, this.videoUrl,
      this.forumUrl});

  factory AnimeEpisode.fromJson(Map<String, dynamic> json) => _$AnimeEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEpisodeToJson(this);
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
class Characters {
  final List<Character> characters;

  Characters({this.characters});

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersToJson(this);
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

@JsonSerializable(fieldRename: FieldRename.snake)
class Articles {
  final List<Article> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Article {
  final Uri url;
  final String title;
  final DateTime date;
  final String authorName;
  final Uri authorUrl;
  final Uri forumUrl;
  final Uri imageUrl;
  final int comments;
  final String intro;


  Article({this.url, this.title, this.date, this.authorName, this.authorUrl,
      this.forumUrl, this.imageUrl, this.comments, this.intro});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Pictures {
  final List<Picture> pictures;

  Pictures({this.pictures});

  factory Pictures.fromJson(Map<String, dynamic> json) => _$PicturesFromJson(json);
  Map<String, dynamic> toJson() => _$PicturesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Picture {
  final Uri large;
  final Uri small;


  Picture({this.large, this.small});

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Video {
  final String title;
  final Uri imageUrl;
  final Uri videoUrl;


  Video({this.title, this.imageUrl, this.videoUrl});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

/// Endpoint: /schedule/<?day>
@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule {
  final List<Anime> monday;
  final List<Anime> tuesday;
  final List<Anime> wednesday;
  final List<Anime> thursday;
  final List<Anime> friday;
  final List<Anime> saturday;
  final List<Anime> sunday;
  final List<Anime> other;
  final List<Anime> unknown;

  Schedule({this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.sunday, this.other, this.unknown});

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}