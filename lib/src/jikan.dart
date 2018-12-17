library jikan;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:safe_config/safe_config.dart';

import 'package:jikan/src/model.dart';


/// Jikan utils
class Jikan {
  JikanClient client;

  Jikan() {
    var config = new ApplicationConfiguration.fromFile(File("jikan.yaml"));
    this.client = new JikanClient(config: config);
  }

  /// Returns an instance of the anime
  Future<Anime> getAnime({@required int id}) async => Anime.fromJson(await client.getJson(endpoint: "anime", args: [ id ]));
  Future<Characters> getAnimeCharacters({@required int id}) async => Characters.fromJson(await client.getJson(endpoint: "anime", args: [ id, "characters_staff" ]));
  Future<Articles> getAnimeArticles({@required int id}) async => Articles.fromJson(await client.getJson(endpoint: "anime", args: [ id, "news" ]));
  Future<AnimeEpisodes> getAnimeEpisodes({@required int id, String page}) async => AnimeEpisodes.fromJson(await client.getJson(endpoint: "anime", args: [ id, "episodes", page ]));
  Future<Pictures> getAnimePictures({@required int id}) async => Pictures.fromJson(await client.getJson(endpoint: "anime", args: [ id, "pictures" ]));
//  Future<Articles> getAnimeVideos({@required int id}) async => Articles.fromJson(await client.getJson(endpoint: "anime", args: [ id, "videos" ]));
  Future<MalStats> getAnimeStats({@required int id}) async => MalStats.fromJson(await client.getJson(endpoint: "anime", args: [ id, "stats" ]));
  Future<MalForum> getAnimeForum({@required int id}) async => MalForum.fromJson(await client.getJson(endpoint: "anime", args: [ id, "forum" ]));
  Future<MalForum> getAnimeMoreInfo({@required int id}) async => MalForum.fromJson(await client.getJson(endpoint: "anime", args: [ id, "moreinfo" ]));

  Future<Schedule> getSchedule({String day}) async => Schedule.fromJson(await client.getJson(endpoint: "schedule", args: [ day ]));
}

class JikanClient extends http.BaseClient {
  final ApplicationConfiguration config;
  http.Client _inner;

  JikanClient({this.config}) {
    this._inner = new http.Client();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = config.api.userAgent;
    return _inner.send(request);
  }

  Uri getApiUrl({@required String endpoint, List<Object> args}) {
    String baseUrl = config.api.baseUrl + "/" + config.api.version + "/";
    if(endpoint != null && endpoint.isNotEmpty) {
      baseUrl += endpoint + "/";
    }
    for(Object arg in args) {
      baseUrl += (arg?.toString() ?? "") + "/";
    }
    return Uri.tryParse(baseUrl);
  }

  dynamic getJson({@required String endpoint, List<Object> args}) async {
    Uri uri = getApiUrl(endpoint: endpoint, args: args);
    http.Response response = await this.get(uri);
    return jsonDecode(response.body);
  }
}

class ApplicationConfiguration extends Configuration {
  ApplicationConfiguration();
  ApplicationConfiguration.fromString(String contents) : super.fromString(contents);
  ApplicationConfiguration.fromFile(File file) : super.fromFile(file);
  ApplicationConfiguration.fromMap(Map map) : super.fromMap(map);

  ApiConfiguration api;
}

class ApiConfiguration extends Configuration {
  ApiConfiguration();
  ApiConfiguration.fromString(String contents) : super.fromString(contents);
  ApiConfiguration.fromFile(File file) : super.fromFile(file);
  ApiConfiguration.fromMap(Map map) : super.fromMap(map);

  String  baseUrl;
  String  version;
  String  userAgent;
}