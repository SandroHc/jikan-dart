// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MalStats _$MalStatsFromJson(Map<String, dynamic> json) {
  return MalStats(
      watching: json['watching'] as int,
      completed: json['completed'] as int,
      onHold: json['on_hold'] as int,
      dropped: json['dropped'] as int,
      planToWatch: json['plan_to_watch'] as int,
      total: json['total'] as int,
      scores: (json['scores'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k, e == null ? null : MalScore.fromJson(e as Map<String, dynamic>))));
}

Map<String, dynamic> _$MalStatsToJson(MalStats instance) => <String, dynamic>{
      'watching': instance.watching,
      'completed': instance.completed,
      'on_hold': instance.onHold,
      'dropped': instance.dropped,
      'plan_to_watch': instance.planToWatch,
      'total': instance.total,
      'scores': instance.scores
    };

MalScore _$MalScoreFromJson(Map<String, dynamic> json) {
  return MalScore(
      votes: json['votes'] as int,
      percentage: (json['percentage'] as num)?.toDouble());
}

Map<String, dynamic> _$MalScoreToJson(MalScore instance) => <String, dynamic>{
      'votes': instance.votes,
      'percentage': instance.percentage
    };

MalForum _$MalForumFromJson(Map<String, dynamic> json) {
  return MalForum(
      topics: (json['topics'] as List)
          ?.map((e) => e == null
              ? null
              : MalForumTopic.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MalForumToJson(MalForum instance) =>
    <String, dynamic>{'topics': instance.topics};

MalForumTopicPost _$MalForumTopicPostFromJson(Map<String, dynamic> json) {
  return MalForumTopicPost(
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      authorName: json['author_name'] as String,
      authorUrl: json['author_url'] == null
          ? null
          : Uri.parse(json['author_url'] as String),
      datePosted: json['date_posted'] == null
          ? null
          : DateTime.parse(json['date_posted'] as String));
}

Map<String, dynamic> _$MalForumTopicPostToJson(MalForumTopicPost instance) =>
    <String, dynamic>{
      'url': instance.url?.toString(),
      'author_name': instance.authorName,
      'author_url': instance.authorUrl?.toString(),
      'date_posted': instance.datePosted?.toIso8601String()
    };

MalForumTopic _$MalForumTopicFromJson(Map<String, dynamic> json) {
  return MalForumTopic(
      topicId: json['topic_id'] as int,
      title: json['title'] as String,
      replies: json['replies'] as int,
      lastPost: json['last_post'] == null
          ? null
          : MalForumTopicPost.fromJson(
              json['last_post'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MalForumTopicToJson(MalForumTopic instance) =>
    <String, dynamic>{
      'topic_id': instance.topicId,
      'title': instance.title,
      'replies': instance.replies,
      'last_post': instance.lastPost
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
      related: (json['related'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) =>
                  e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
              ?.toList())),
      producers: (json['producers'] as List)
          ?.map((e) =>
              e == null ? null : Company.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      licensors: json['licensors'] == null
          ? null
          : Anime._licensorsFrom(json['licensors'] as List),
      studios: (json['studios'] as List)
          ?.map((e) =>
              e == null ? null : Company.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      titleSynonyms:
          (json['title_synonyms'] as List)?.map((e) => e as String)?.toList(),
      type: json['type'] as String,
      source: json['source'] as String,
      status: json['status'] as String,
      airing: json['airing'] as bool,
      aired: json['aired'] == null
          ? null
          : AnimeAired.fromJson(json['aired'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Anime._durationFrom(json['duration'] as String),
      rating: json['rating'] as String,
      score: (json['score'] as num)?.toDouble(),
      scoredBy: json['scored_by'] as int,
      popularity: json['popularity'] as int,
      members: json['members'] as int,
      favorites: json['favorites'] as int,
      synopsis: json['synopsis'] as String,
      background: json['background'] as String,
      premiered: json['premiered'] as String,
      broadcast: json['broadcast'] as String,
      genres: (json['genres'] as List)
          ?.map((e) =>
              e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      openingThemes:
          (json['opening_themes'] as List)?.map((e) => e as String)?.toList(),
      endingThemes:
          (json['ending_themes'] as List)?.map((e) => e as String)?.toList(),
      characters: json['characters'] == null
          ? null
          : Characters.fromJson(json['characters'] as Map<String, dynamic>),
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      trailerUrl: json['trailer_url'] == null
          ? null
          : Uri.parse(json['trailer_url'] as String),
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String,
      titleJapanese: json['title_japanese'] as String,
      articles: json['articles'] == null
          ? null
          : Articles.fromJson(json['articles'] as Map<String, dynamic>),
      episodes: json['episodes'] as int,
      pictures: json['pictures'] == null
          ? null
          : Pictures.fromJson(json['pictures'] as Map<String, dynamic>),
      videos: (json['videos'] as Map<String, dynamic>)?.map((k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) =>
                  e == null ? null : Video.fromJson(e as Map<String, dynamic>))
              ?.toList())),
      r18: json['r18'] as bool,
      kids: json['kids'] as bool,
      stats:
          json['stats'] == null ? null : MalStats.fromJson(json['stats'] as Map<String, dynamic>),
      forum: json['forum'] == null ? null : MalForum.fromJson(json['forum'] as Map<String, dynamic>),
      moreInfo: json['more_info'] == null ? null : MalForum.fromJson(json['more_info'] as Map<String, dynamic>),
      episodeList: json['episode_list'] == null ? null : AnimeEpisodes.fromJson(json['episode_list'] as Map<String, dynamic>))
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'image_url': instance.imageUrl?.toString(),
      'trailer_url': instance.trailerUrl?.toString(),
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_japanese': instance.titleJapanese,
      'title_synonyms': instance.titleSynonyms,
      'type': instance.type,
      'source': instance.source,
      'episodes': instance.episodes,
      'status': instance.status,
      'airing': instance.airing,
      'aired': instance.aired,
      'duration': instance.duration == null
          ? null
          : Anime._durationTo(instance.duration),
      'rating': instance.rating,
      'score': instance.score,
      'scored_by': instance.scoredBy,
      'popularity': instance.popularity,
      'members': instance.members,
      'favorites': instance.favorites,
      'synopsis': instance.synopsis,
      'background': instance.background,
      'premiered': instance.premiered,
      'broadcast': instance.broadcast,
      'related': instance.related,
      'producers': instance.producers,
      'licensors': instance.licensors,
      'studios': instance.studios,
      'genres': instance.genres,
      'opening_themes': instance.openingThemes,
      'ending_themes': instance.endingThemes,
      'r18': instance.r18,
      'kids': instance.kids,
      'characters': instance.characters,
      'articles': instance.articles,
      'episode_list': instance.episodeList,
      'pictures': instance.pictures,
      'videos': instance.videos,
      'stats': instance.stats,
      'forum': instance.forum,
      'more_info': instance.moreInfo
    };

AnimeEpisodes _$AnimeEpisodesFromJson(Map<String, dynamic> json) {
  return AnimeEpisodes(
      episodesLastPage: json['episodes_last_page'] as int,
      episodes: (json['episodes'] as List)
          ?.map((e) => e == null
              ? null
              : AnimeEpisode.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AnimeEpisodesToJson(AnimeEpisodes instance) =>
    <String, dynamic>{
      'episodes_last_page': instance.episodesLastPage,
      'episodes': instance.episodes
    };

AnimeEpisode _$AnimeEpisodeFromJson(Map<String, dynamic> json) {
  return AnimeEpisode(
      episodeId: json['episode_id'] as int,
      title: json['title'] as String,
      titleJapanese: json['title_japanese'] as String,
      titleRomanji: json['title_romanji'] as String,
      aired: json['aired'] == null
          ? null
          : AnimeAired.fromJson(json['aired'] as Map<String, dynamic>),
      filler: json['filler'] as bool,
      recap: json['recap'] as bool,
      videoUrl: json['video_url'] == null
          ? null
          : Uri.parse(json['video_url'] as String),
      forumUrl: json['forum_url'] == null
          ? null
          : Uri.parse(json['forum_url'] as String));
}

Map<String, dynamic> _$AnimeEpisodeToJson(AnimeEpisode instance) =>
    <String, dynamic>{
      'episode_id': instance.episodeId,
      'title': instance.title,
      'title_japanese': instance.titleJapanese,
      'title_romanji': instance.titleRomanji,
      'aired': instance.aired,
      'filler': instance.filler,
      'recap': instance.recap,
      'video_url': instance.videoUrl?.toString(),
      'forum_url': instance.forumUrl?.toString()
    };

AnimeAired _$AnimeAiredFromJson(Map<String, dynamic> json) {
  return AnimeAired(
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String));
}

Map<String, dynamic> _$AnimeAiredToJson(AnimeAired instance) =>
    <String, dynamic>{
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String()
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(type: json['type'] as String, name: json['name'] as String)
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'type': instance.type,
      'name': instance.name
    };

Characters _$CharactersFromJson(Map<String, dynamic> json) {
  return Characters(
      characters: (json['characters'] as List)
          ?.map((e) =>
              e == null ? null : Character.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{'characters': instance.characters};

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      name: json['name'] as String,
      role: json['role'] as String,
      voice_actors: (json['voice_actors'] as List)
          ?.map((e) =>
              e == null ? null : VoiceActor.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'image_url': instance.imageUrl?.toString(),
      'name': instance.name,
      'role': instance.role,
      'voice_actors': instance.voice_actors
    };

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(type: json['type'] as String, name: json['name'] as String)
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'type': instance.type,
      'name': instance.name
    };

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
      name: json['name'] as String,
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String))
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'name': instance.name,
      'image_url': instance.imageUrl?.toString()
    };

VoiceActor _$VoiceActorFromJson(Map<String, dynamic> json) {
  return VoiceActor(language: json['language'] as String)
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$VoiceActorToJson(VoiceActor instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'language': instance.language
    };

Staff _$StaffFromJson(Map<String, dynamic> json) {
  return Staff(
      positions: (json['positions'] as List)?.map((e) => e as String)?.toList())
    ..malId = json['mal_id'] as int
    ..url = json['url'] == null ? null : Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url?.toString(),
      'positions': instance.positions
    };

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
      articles: (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : Article.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) =>
    <String, dynamic>{'articles': instance.articles};

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      title: json['title'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      authorName: json['author_name'] as String,
      authorUrl: json['author_url'] == null
          ? null
          : Uri.parse(json['author_url'] as String),
      forumUrl: json['forum_url'] == null
          ? null
          : Uri.parse(json['forum_url'] as String),
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      comments: json['comments'] as int,
      intro: json['intro'] as String);
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'url': instance.url?.toString(),
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'author_name': instance.authorName,
      'author_url': instance.authorUrl?.toString(),
      'forum_url': instance.forumUrl?.toString(),
      'image_url': instance.imageUrl?.toString(),
      'comments': instance.comments,
      'intro': instance.intro
    };

Pictures _$PicturesFromJson(Map<String, dynamic> json) {
  return Pictures(
      pictures: (json['pictures'] as List)
          ?.map((e) =>
              e == null ? null : Picture.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PicturesToJson(Pictures instance) =>
    <String, dynamic>{'pictures': instance.pictures};

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
      large: json['large'] == null ? null : Uri.parse(json['large'] as String),
      small: json['small'] == null ? null : Uri.parse(json['small'] as String));
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large?.toString(),
      'small': instance.small?.toString()
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
      title: json['title'] as String,
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      videoUrl: json['video_url'] == null
          ? null
          : Uri.parse(json['video_url'] as String));
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl?.toString(),
      'video_url': instance.videoUrl?.toString()
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
      monday: (json['monday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      tuesday: (json['tuesday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      wednesday: (json['wednesday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      thursday: (json['thursday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      friday: (json['friday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      saturday: (json['saturday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      sunday: (json['sunday'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      other: (json['other'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      unknown: (json['unknown'] as List)
          ?.map((e) =>
              e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'other': instance.other,
      'unknown': instance.unknown
    };
