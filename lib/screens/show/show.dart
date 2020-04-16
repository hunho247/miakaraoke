class Show {
  String eid;
  String title;
  String desc;
  String image;
  String dateRange;
  String time;
  String duration;
  String address;
  String phone;
  String email;
  String poster;
  List<String> registers;
  int revisionTime;

  Show(
      {this.eid,
      this.title,
      this.desc,
      this.image,
      this.dateRange,
      this.time,
      this.duration,
      this.address,
      this.phone,
      this.email,
      this.poster,
      this.registers,
      this.revisionTime});

  Show.fromJson(Map<String, dynamic> json) {
    eid = json['eid'];
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    dateRange = json['dateRange'];
    time = json['time'];
    duration = json['duration'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    poster = json['poster'];
    registers = json['registers'].cast<String>();
    revisionTime = json['revisionTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['dateRange'] = this.dateRange;
    data['time'] = this.time;
    data['duration'] = this.duration;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['poster'] = this.poster;
    data['registers'] = this.registers;
    data['revisionTime'] = this.revisionTime;
    return data;
  }
}
