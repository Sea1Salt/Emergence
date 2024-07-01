class Admin {
  String? Illness;
  String? CardNumber;
  String? ContactNumber;
  String? latitude;
  String? longitude;
  String? image;
  int? callid;

  Admin({
    this.Illness = "",
    this.CardNumber = "",
    this.ContactNumber = "",
    this.latitude = "",
    this.longitude = "",
    this.image = "",
    this.callid,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        Illness: json["illnessname"].toString(),
        CardNumber: json["card_ID"].toString(),
        ContactNumber: json["contactNumber"].toString(),
        latitude: json["latitude"].toString(),
        longitude: json["longitude"].toString(),
        image: json["image"].toString(),
        callid: int.parse(json["callId"].toString())
    );
    // Illness = json['Illness'].toString();
    // CardNumber = json['CardNumber'].toString();
    // ContactNumber = json['ContactNumber'].toString();
    // latitude = json['latitude'].toString();
    // longitude = json['longitude'].toString();
    // image = json['image'].toString();
  }
}
