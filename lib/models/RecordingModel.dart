import 'package:flutter/widgets.dart';
import 'RecordingHelper.dart';
import 'SoundRecording.dart';

class RecordingModel extends ChangeNotifier {
  RecordingHelper db;
  List<SoundRecording> recordings = List<SoundRecording>();

  RecordingModel() {
    db = RecordingHelper();
    getRecordings();
  }

  getRecordings() async {
    recordings = await db.recordings();
    notifyListeners();
  }

  addRecording(SoundRecording recording) async {
    recordings.add(recording);
    await db.insertRecording(recording);
    notifyListeners();
  }

  delRecording(SoundRecording recording) async {
    recordings.remove(recording);
    await db.deleteRecording(recording.id);
    notifyListeners();
  }
}
