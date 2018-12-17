import 'package:jikan/jikan.dart';

void main() async {
  Jikan jikan = Jikan();

  /// Fetches the anime "Sword Art Online: Alicization"
  Anime anime = await jikan.getAnime(id: 36474);
  print(anime.title);

  /// Fetches the schedule for the anime airing this week
  jikan.getSchedule().then((schedule) => print(schedule.monday));
}