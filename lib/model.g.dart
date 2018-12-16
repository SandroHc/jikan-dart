// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
      related: (json['related'] as Map<String, dynamic>)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  ?.map((e) => e == null
                      ? null
                      : Anime.fromJson(e as Map<String, dynamic>))
                  ?.toList())),
      producers: (json['producers'] as List)
          ?.map((e) =>
              e == null ? null : Company.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      licensors: (json['licensors'] as List)
          ?.map((e) =>
              e == null ? null : Company.fromJson(e as Map<String, dynamic>))
          ?.toList(),
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
      characters: (json['characters'] as List)
          ?.map((e) =>
              e == null ? null : Character.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      trailerUrl: json['trailer_url'] == null
          ? null
          : Uri.parse(json['trailer_url'] as String),
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String,
      titleJapanese: json['title_japanese'] as String)
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
      'characters': instance.characters
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
