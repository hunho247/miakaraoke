import 'package:cloud_firestore/cloud_firestore.dart';

import 'show.dart';


class EventProvider {
  static Firestore _ins = Firestore.instance;
  static final String _path = "show";

  static Future<void> postShowRecord(Show event) async {
    _ins.collection(_path).document().setData(event.toJson());
  }
}
