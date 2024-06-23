class Illness {
  int? lillnessid;
  String? illnessname="";
  String? illnesspic;

  Illness({
    this.lillnessid,
    this.illnessname="",
    this.illnesspic,
  });

  // Hospital.fromJson(Map<String, dynamic> json) {
  //   //Hospitalname = json['hospitalname'].toString();
  //   // latitude = json['latitude'].toDouble();
  //   // longtitude = json['longitude'].toDouble();
  // }
  factory Illness.fromJson(Map<String, dynamic> json) {
    return Illness(illnessname: json["illnessname"].toString(),
    lillnessid: int.parse(json["illnessID"].toString()),
    illnesspic: json["illnesspic"].toString());
  }
}
