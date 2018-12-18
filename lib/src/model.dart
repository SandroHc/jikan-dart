import 'package:json_annotation/json_annotation.dart';

/// Rebuild with command: flutter packages pub run build_runner build
part 'package:jikan/src/model.g.dart';

/// Base mode class.
abstract class MalBase {
  /// ID associated with MyAnimeList.
  int malId;

  /// URL to MyAnimeList's page.
  Uri url;

  MalBase({this.malId, this.url});
}

/// Stats model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class MalStats {
  /// Number of users watching this.
  final int watching;

  /// Number of users that completed this.
  final int completed;

  /// Number of users that marked this as "on-hold".
  final int onHold;

  /// Number of users that dropped this.
  final int dropped;

  /// Number of users that plan to watch this.
  final int planToWatch;

  /// Number of total users.1
  final int total;

  /// Distribution of scores, from 1 to 10
  final Map<String, MalScore> scores;

  MalStats(
      {this.watching,
      this.completed,
      this.onHold,
      this.dropped,
      this.planToWatch,
      this.total,
      this.scores});

  factory MalStats.fromJson(Map<String, dynamic> json) =>
      _$MalStatsFromJson(json);
  Map<String, dynamic> toJson() => _$MalStatsToJson(this);
}

/// Score model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class MalScore {
  /// Number of votes.
  final int votes;

  /// Relative percentage of votes.
  final double percentage;

  MalScore({this.votes, this.percentage});

  factory MalScore.fromJson(Map<String, dynamic> json) =>
      _$MalScoreFromJson(json);
  Map<String, dynamic> toJson() => _$MalScoreToJson(this);
}

/// Forum model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class MalForum {
  /// List of forum topics.
  final List<MalForumTopic> topics;

  MalForum({this.topics});

  factory MalForum.fromJson(Map<String, dynamic> json) =>
      _$MalForumFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumToJson(this);
}

/// Topic Post model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class MalForumTopicPost {
  /// Post's URL;
  final Uri url;

  /// Author's name
  // TODO move this into it's subclass?
  final String authorName;

  /// Author's URL
  // TODO move this into it's subclass?
  final Uri authorUrl;

  /// Date of posting.
  final DateTime datePosted;

  MalForumTopicPost(
      {this.url, this.authorName, this.authorUrl, this.datePosted});

  factory MalForumTopicPost.fromJson(Map<String, dynamic> json) =>
      _$MalForumTopicPostFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumTopicPostToJson(this);
}

/// Topic model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class MalForumTopic extends MalForumTopicPost {
  /// Topic's ID on MyAnimeList.
  final int topicId;

  /// Topic's title;
  final String title;

  /// Topic's numbr of replies.
  final int replies;

  /// Topic's last post.
  final MalForumTopicPost lastPost;

  MalForumTopic({this.topicId, this.title, this.replies, this.lastPost});

  factory MalForumTopic.fromJson(Map<String, dynamic> json) =>
      _$MalForumTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MalForumTopicToJson(this);
}

/// Anime model class.
/// Endpoint: /anime/<id>
@JsonSerializable(fieldRename: FieldRename.snake)
class Anime extends MalBase {
  /// Title of the anime.
  final String title;

  /// Title of the anime in English.
  final String titleEnglish;

  /// Title of the anime in Japanese.
  final String titleJapanese;

  /// Anime's multiple titles (if any).
  final List<String> titleSynonyms;

  /// Anime's image URL.
  final Uri imageUrl;

  /// Anime's trailer URL.
  final Uri trailerUrl;

  /// Anime type (e. g. "TV", "Movie").
  // TODO: convert to enum?
  final String type;

  /// Anime source (e .g. "Manga" or "Original").
  // TODO: convert to enum?
  final String source;

  /// Anime's episode count.
  final int episodes;
  final String status;

  /// Is anime currently airing.
  final bool airing;

  /// Date when anime started/will start airing.
  final DateTime airingStart;

  /// Time period of starting and ending anime dates.
  final AnimeAired aired;

  /// Anime's duration per episode.
  @JsonKey(fromJson: _durationFrom, toJson: _durationTo)
  final Duration duration;

  /// Anime's age rating.
  final String rating;

  /// Anime's score on MyAnimeList, up to 2 decimal places.
  final double score;

  /// Number of people the anime has been scored by.
  final int scoredBy;

  /// Anime rank on MyAnimeList (score).
  final int rank;

  /// Anime popularity rank on MyAnimeList.
  final int popularity;

  /// Anime members count on MyAnimeList.
  final int members;

  /// Anime favourite count on MyAnimeList.
  final int favorites;

  /// Anime's synopsis.
  final String synopsis;

  /// Anime's background info. Empty if don't have any.
  final String background;

  /// Season and year the anime premiered.
  // TODO: break down into own subclass?
  final String premiered;

  /// Anime broadcast day and timings (usually JST).
  // TODO: attempt parsing into own subclass
  final String broadcast;

  /// Anime's related items (anime, manga, spin offs, etc.)
  final Map<String, List<Anime>> related;

  /// Anime's producers.
  final List<Company> producers;

  /// Anime's licensors.
  @JsonKey(fromJson: _licensorsFrom)
  final List<Company> licensors;

  /// Anime's studio(s) numerically indexed with array values.
  final List<Company> studios;

  /// Anime's genres.
  final List<Genre> genres;

  /// Anime's opening themes' names and author.
  // TODO: attempt parsing into own subclass
  final List<String> openingThemes;

  /// Anime's ending themes' names and author.
  // TODO: attempt parsing into own subclass
  final List<String> endingThemes;

  /// Is anime suitable for kids.
  final bool r18; // Seen in the schedule
  /// Is anime marked for adult audiences only.
  final bool kids; // Seen in the schedule
  /// Is anime continuing from last season.
  final bool continued; // Seen in the schedule

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

  Anime(
      {this.title,
      this.titleEnglish,
      this.titleJapanese,
      this.titleSynonyms,
      this.imageUrl,
      this.trailerUrl,
      this.type,
      this.source,
      this.episodes,
      this.status,
      this.airing,
      this.airingStart,
      this.aired,
      this.duration,
      this.rating,
      this.score,
      this.scoredBy,
      this.rank,
      this.popularity,
      this.members,
      this.favorites,
      this.synopsis,
      this.background,
      this.premiered,
      this.broadcast,
      this.related,
      this.producers,
      this.licensors,
      this.studios,
      this.genres,
      this.openingThemes,
      this.endingThemes,
      this.r18,
      this.kids,
      this.continued,
      this.characters,
      this.articles,
      this.episodeList,
      this.pictures,
      this.videos,
      this.stats,
      this.forum,
      this.moreInfo});

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
    if (hours > 0) {
      str += hours.toString() + " hr ";
    }
    return str + minutes.toString() + " min";
  }

  static List<Company> _licensorsFrom(List<dynamic> response) {
    return response
        .map(
            (val) => val is String ? Company(name: val) : Company.fromJson(val))
        .toList();
  }
}

/// Episodes model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeEpisodes {
  /// Number of the last page of episodes. Pagination starts to occur past the 100 episodes.
  final int episodesLastPage;

  /// List of episodes.
  final List<AnimeEpisode> episodes;

  AnimeEpisodes({this.episodesLastPage, this.episodes});

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpisodesFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEpisodesToJson(this);
}

/// Episode model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeEpisode {
  /// Episode's ID, on MyAnimeList.
  final int episodeId;

  /// Episode's title.
  final String title;

  /// Episode's title in japanese.
  final String titleJapanese;

  /// Episode's title in romanji.
  final String titleRomanji;

  /// Episode's airing date.
  final AnimeAired aired;

  /// Is filler episode.
  final bool filler;

  /// Is recap episode.
  final bool recap;

  /// Episode's video URL.
  final Uri videoUrl;

  /// Episode's forum URL.
  final Uri forumUrl;

  AnimeEpisode(
      {this.episodeId,
      this.title,
      this.titleJapanese,
      this.titleRomanji,
      this.aired,
      this.filler,
      this.recap,
      this.videoUrl,
      this.forumUrl});

  factory AnimeEpisode.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEpisodeToJson(this);
}

/// Aired model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeAired {
  /// Airing start date.
  final DateTime from;

  /// Airing end date.
  final DateTime to;

  AnimeAired({this.from, this.to});

  factory AnimeAired.fromJson(Map<String, dynamic> json) =>
      _$AnimeAiredFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeAiredToJson(this);
}

/// Genre model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Genre extends MalBase {
  /// Genre's type
  final String type;

  /// Genre's name
  final String name;

  Genre({this.type, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

/// Anime's characters and staff model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Characters {
  /// Anime's characters collection with basic information.
  final List<Character> characters;

  Characters({this.characters});

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}

/// Character model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Character extends MalBase {
  /// Character's image URL.
  final Uri imageUrl;

  /// Character's name.
  final String name;
  final String role;

  /// Character's voice actors.
  final List<VoiceActor> voice_actors;

  Character({this.imageUrl, this.name, this.role, this.voice_actors});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

/// Company model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Company extends MalBase {
  /// Company's type.
  final String type;

  /// Company's name.
  final String name;

  Company({this.type, this.name});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

/// Person model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Person extends MalBase {
  /// Person's name.
  final String name;

  /// Person's image URL.
  final Uri imageUrl;

  Person({this.name, this.imageUrl});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

/// Voice Actor model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class VoiceActor extends Person {
  /// Voice actor's used language.
  final String language;

  VoiceActor({this.language});

  factory VoiceActor.fromJson(Map<String, dynamic> json) =>
      _$VoiceActorFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceActorToJson(this);
}

/// Staff model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Staff extends Person {
  /// Staff's positions (e.g.).
  final List<String> positions;

  Staff({this.positions});

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  Map<String, dynamic> toJson() => _$StaffToJson(this);
}

/// Articles model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Articles {
  /// List of articles.
  final List<Article> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

/// Article model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Article {
  /// Article's URL.
  final Uri url;

  /// Article's title.
  final String title;

  /// Article's posting date.
  final DateTime date;

  /// Author's name
  // TODO subclass
  final String authorName;

  /// Author's URL.
  // TODO subclass
  final Uri authorUrl;

  /// Article's forum URL.
  final Uri forumUrl;

  /// Article's image URL.
  final Uri imageUrl;

  /// Article's number of comments.
  final int comments;

  /// Article's summary.
  final String intro;

  Article(
      {this.url,
      this.title,
      this.date,
      this.authorName,
      this.authorUrl,
      this.forumUrl,
      this.imageUrl,
      this.comments,
      this.intro});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

/// Pictures model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Pictures {
  /// List of pictures.
  final List<Picture> pictures;

  Pictures({this.pictures});

  factory Pictures.fromJson(Map<String, dynamic> json) =>
      _$PicturesFromJson(json);
  Map<String, dynamic> toJson() => _$PicturesToJson(this);
}

/// Picture model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Picture {
  /// Picture's high-resultion variant URL.
  final Uri large;

  /// Picture's low-resultion variant URL.
  final Uri small;

  Picture({this.large, this.small});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

/// Video model class.
@JsonSerializable(fieldRename: FieldRename.snake)
class Video {
  /// Video's title.
  final String title;

  /// Video's thumbnail URL.
  final Uri imageUrl;

  /// Video's URL.
  final Uri videoUrl;

  Video({this.title, this.imageUrl, this.videoUrl});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

/// Schedule model class.
/// Endpoint: /schedule/<?day>
@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule {
  /// List of anime which episodes are airing on monday.
  final List<Anime> monday;

  /// List of anime which episodes are airing on tuesday.
  final List<Anime> tuesday;

  /// List of anime which episodes are airing on wednesday.
  final List<Anime> wednesday;

  /// List of anime which episodes are airing on thursday.
  final List<Anime> thursday;

  /// List of anime which episodes are airing on friday.
  final List<Anime> friday;

  /// List of anime which episodes are airing on saturday.
  final List<Anime> saturday;

  /// List of anime which episodes are airing on sunday.
  final List<Anime> sunday;

  /// List of anime which episodes are airing sometime during this week.
  final List<Anime> other;

  /// List of anime with unknown airing date for this week.
  final List<Anime> unknown;

  Schedule(
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday,
      this.other,
      this.unknown});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
