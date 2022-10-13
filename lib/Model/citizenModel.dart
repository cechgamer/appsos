

class CitizenUserModel {
  String?uid;
  String? email;
  String? name;
  String? phone;
  String? nationalId;
  String? resume;
  String? image;
  String? country;
  String? citizen;
  String?password;
  CitizenUserModel({this.password,this.uid,this.email, this.name,this.phone,this.nationalId,this.resume,this.image, this.country,this.citizen});

///////Receive Data From Server/////////////
  factory CitizenUserModel.fromMap(map){
    return CitizenUserModel(
        uid: map['uid'],
        email: map['email'],
        password:map['password'],
        name: map['name'],
        phone: map['phone'],
        nationalId: map['nationalId'],
        resume: map['resume'],
        image: map['ImageUrl'],
        country: map['country'],
        citizen: map['citizen']

    );
  }

  ////Sending Data From Server/////////////
  Map<String, dynamic> toMap() {
    return {
      'uid':uid,
      'email': email,
      'password':password,
      'name': name,
      'phone': phone,
      'nationalId': nationalId,
      'country': country,
      'ImageUrl': image,
      'citizen':citizen
    };
  }
}
/////////////////////////////////////////////////////////////////////////////////

class CitizenUser {

  String? action;

  CitizenUser({ this.action});

///////Receive Data From Server/////////////
  factory CitizenUser.fromMap(map){
    return CitizenUser(
        action: map['action']

    );
  }

  ////Sending Data From Server/////////////
  Map<String, dynamic> toMap() {
    return {

      'action':action
    };
  }
}