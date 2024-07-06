class Profile {
  String firstname = "";
  String lastname = "";
  String nickname = "";
  String birthdate = "";
  String gender = "";
  String age = "";
  String weight = "";
  String height = "";
  String cardID = "";
  String drugallergy = "";
  String foodallergy = "";
  String congennitaldisease = "";
  String address = "";
  String tel = "";
  String emergencynum1 = "";
  String relatename1 = "";
  String relation1 = "";
  String emergencynum2 = "";
  String relatename2 = "";
  String relation2 = "";
  String image = "";

  Profile({
    this.firstname = "",
    this.lastname = "",
    this.image = "",
    this.nickname = "",
    this.birthdate = "",
    this.gender = "",
    this.age = "",
    this.weight = "",
    this.height = "",
    this.cardID = "",
    this.drugallergy = "",
    this.foodallergy = "",
    this.congennitaldisease = "",
    this.address = "",
    this.tel = "",
    this.emergencynum1 = "",
    this.relatename1 = "",
    this.relation1 = "",
    this.emergencynum2 = "",
    this.relatename2 = "",
    this.relation2 = "",
  });

  Profile.fromJson(Map<String, dynamic> json) {
    firstname = json['firstName'].toString();
    lastname = json['lastName'].toString();
    image = json['image'].toString();
    nickname = json['nickname'].toString();
    birthdate = json['birthdate'].toString();
    gender = json['gender'].toString();
    age = json['age'].toString();
    weight = json['weight'].toString();
    height = json['height'].toString();
    cardID = json['cardId'].toString();
    drugallergy = json['drugAllergy'].toString();
    foodallergy = json['foodAllergy'].toString();
    congennitaldisease = json['congenitalDisease'].toString();
    address = json['address'].toString();
    tel = json['tel'].toString();
    emergencynum1 = json['emergencyPhoneNumber1'].toString();
    relatename1 = json['relateName1'].toString();
    relation1 = json['relation1'].toString();
    emergencynum2 = json['emergencyPhoneNumber2'].toString();
    relatename2 = json['relateName2'].toString();
    relation2 = json['relation2'].toString();

  }
}
