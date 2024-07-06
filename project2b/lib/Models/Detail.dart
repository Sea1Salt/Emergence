class Detail {
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
  String latitude = "";
  String longitude = "";

  Detail({
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
    this.latitude="",
    this.longitude=""
  });

  Detail.fromJson(Map<String, dynamic> json) {
    firstname = json['first_name'].toString();
    lastname = json['last_name'].toString();
    image = json['nickname'].toString();
    nickname = json['nickname'].toString();
    birthdate = json['birthdate'].toString();
    gender = json['gender'].toString();
    age = json['age'].toString();
    weight = json['weight'].toString();
    height = json['height'].toString();
    cardID = json['card_ID'].toString();
    drugallergy = json['drug_allergy'].toString();
    foodallergy = json['food_allergy'].toString();
    congennitaldisease = json['congennital_disease'].toString();
    address = json['adress'].toString();
    tel = json['tel'].toString();
    emergencynum1 = json['emergency_phone_number1'].toString();
    relatename1 = json['relate_name1'].toString();
    relation1 = json['relation1'].toString();
    emergencynum2 = json['emergency_phone_number2'].toString();
    relatename2 = json['relate_name2'].toString();
    relation2 = json['relation2'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();

  }
}
