library jikan;

import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:jikan/model.dart';

const JIKAN_API_URL = "https://api.jikan.moe";
const JIKAN_API_VERSION = "v3";

/// Jikan utils
class Jikan {
  final JikanClient client = new JikanClient();

  /// Returns an instance of the anime
  Future<Anime> getAnime({@required int id}) async => Anime.fromJson(await client.getJson(endpoint: "anime", args: [ id ]));
}

class JikanClient extends http.BaseClient {
  final String userAgent = "Jikan Dart/0.0.1";
  http.Client _inner;

  JikanClient() {
    this._inner = new http.Client();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }

  Uri getApiUrl({@required String endpoint, List<Object> args}) {
    String baseUrl = JIKAN_API_URL + "/" + JIKAN_API_VERSION + "/";
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