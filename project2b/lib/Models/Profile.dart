class Profile {
  String firstname="";
  String lastname="";
  Profile({this.firstname="", this.lastname=""});

  Profile.fromJson(Map<String, dynamic> json) {
    firstname = json['firstName'].toString();
    lastname = json['lastName'].toString();
  }
}
