import 'package:test/test.dart';

import 'package:jikan/jikan.dart';
import 'package:jikan/model.dart';

void main() {
  final instance = Jikan();
  final int ANIME_ID = 36474; // ID for the anime "Sword Art Online: Alicization"

  test('Anime request', () async {
    Anime anime = await instance.getAnime(id: ANIME_ID);
    expect(anime, isNotNull);
    expect(anime.malId, isNotNull);
  });
}
