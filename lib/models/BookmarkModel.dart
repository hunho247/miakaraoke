import 'package:flutter/widgets.dart';
import 'BookmarkHelper.dart';
import 'KaraokeSong.dart';

class BookmarkModel extends ChangeNotifier {
  BookmarkHelper db;
  List<KaraokeSong> likedKaraokes = List<KaraokeSong>();

  BookmarkModel() {
    db = BookmarkHelper();
    getLikedKaraokes();
  }

  markLikedKaraoke(int index, int fav) async {
    likedKaraokes[index].favorite = fav == 0 ? 0 : 1;
    await db.markLikedKaraoke(
        likedKaraokes[index].id, likedKaraokes[index].favorite);
    notifyListeners();
  }

  getLikedKaraokes() async {
    likedKaraokes = await db.getLikedKaraokes();
    notifyListeners();
  }

  updateLikedKaraokes() async {
    //likedKaraokes.clear();
    likedKaraokes = await db.getLikedKaraokes();
    notifyListeners();
  }
}
