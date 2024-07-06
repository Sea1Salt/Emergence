class Admin {
  String? firstname;
  String? lastname;
  String? Illness;
  String? CardNumber;
  String? ContactNumber;
  String? latitude;
  String? longitude;
  String? image;
  int? callid;
  int? status;

  Admin({
    this.Illness = "",
    this.CardNumber = "",
    this.ContactNumber = "",
    this.latitude = "",
    this.longitude = "",
    this.image = "",
    this.status,
    this.callid,
    this.firstname = "",
    this.lastname = "",
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        Illness: json["illnessname"].toString(),
        CardNumber: json["card_ID"].toString(),
        ContactNumber: json["contactNumber"].toString(),
        latitude: json["latitude"].toString(),
        longitude: json["longitude"].toString(),
        image: json["image"].toString(),
        callid: int.parse(json["callId"].toString()),
        status: int.parse(json["status"].toString()),
        firstname: json["first_name"].toString(),
        lastname: json["last_name"].toString(),
        );
        
        


    // Illness = json['Illness'].toString();
    // CardNumber = json['CardNumber'].toString();
    // ContactNumber = json['ContactNumber'].toString();
    // latitude = json['latitude'].toString();
    // longitude = json['longitude'].toString();
    // image = json['image'].toString();
  }
}
