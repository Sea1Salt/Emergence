class Hospital {
  String? Hospitalname = "";
  double? latitude;
  double? longtitude;

  Hospital({
    this.Hospitalname = "",
    this.latitude,
    this.longtitude,
  });

  // Hospital.fromJson(Map<String, dynamic> json) {
  //   //Hospitalname = json['hospitalname'].toString();
  //   // latitude = json['latitude'].toDouble();
  //   // longtitude = json['longitude'].toDouble();
  // }
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(Hospitalname: json["hospitalname"].toString(),
    latitude: json["latitude"],
    longtitude: json["longitude"]);
  }
}
