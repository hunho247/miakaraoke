import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/firebase/favorite_model.dart';

class FavoriteProvider {
  static Firestore _ins = Firestore.instance;
  static final String _path = "favorite";

  static Stream<QuerySnapshot> getFavKaraokeList() {
    return _ins.collection(_path).snapshots();
  }

  static Future<void> postFavKaraoke(Favorite favorite) async {
    _ins
        .collection(_path)
        .document(favorite.videoId)
        .setData(favorite.toJson());
  }
}
