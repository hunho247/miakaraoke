import 'package:flutter/widgets.dart';
import 'KaraokeLibraryHelper.dart';
import 'KaraokeSong.dart';

class KaraokeLibraryModel extends ChangeNotifier {
  KaraokeLibraryHelper db;
  List<KaraokeSong> karaokesong = List<KaraokeSong>();

  KaraokeLibraryModel() {
    db = KaraokeLibraryHelper();
    getLimitedKaraokeList(0, 20);
  }

  markLikedKaraoke(int index, int fav) async {
    karaokesong[index].favorite = fav == 0 ? 0 : 1;
    await db.markLikedKaraoke(
        karaokesong[index].id, karaokesong[index].favorite);
    notifyListeners();
  }

  searchKaraoke(String karaoke) async {
    karaokesong = await db.searchKaraokes(karaoke);
    notifyListeners();
  }

  fetchKaraokeList() async {
    karaokesong = await db.getKaraokes();
    notifyListeners();
  }

  getLimitedKaraokeList(int present, int perPage) async {
    karaokesong = await db.getLimitedKaraokeList(present, perPage);
    notifyListeners();
  }

  addMoreKaraokeList(int present, int perPage) async {
    karaokesong.addAll(await db.getLimitedKaraokeList(present, perPage));
    notifyListeners();
  }

  clear() async {
    karaokesong.clear();
  }
}
