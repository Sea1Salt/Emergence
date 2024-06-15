class Profile {
  String firstname="";
  String lastname="";
  String image="";
  Profile({this.firstname="", this.lastname="",this.image=""});

  Profile.fromJson(Map<String, dynamic> json) {
    firstname = json['firstName'].toString();
    lastname = json['lastName'].toString();
    image = json['image'].toString();
  }
}
