import 'dart:ffi';

class Login {
  bool? isAuthen;
  bool? role;
  

  Login({
    this.isAuthen ,
    this.role ,
    
  });

   Login.fromJson(Map<String, dynamic> json) {
    isAuthen = bool.parse(json['isAuthen'].toString());
    role = bool.parse(json['role'].toString());
    

  }
}
