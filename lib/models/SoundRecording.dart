class SoundRecording {
  int id;
  String name;
  String path;

  SoundRecording({this.id, this.name, this.path});

  SoundRecording.fromMap(Map m) {
    id = m["id"];
    name = m["name"];
    path = m["path"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
    };
  }
}
