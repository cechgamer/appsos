


class UserModel {
  String?uid;
  String? email;
  String? name;
  String? phone;
  String? nationalId;
  String? resume;
  String? schedule;
  String? image;
  String? country;
  String? psychologist;
  String?password;
  UserModel({this.password,this.uid,this.email, this.name,this.phone,this.nationalId,this.resume,this.image, this.country,this.schedule,this.psychologist});

///////Receive Data From Server/////////////
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      password:map['password'],
      name: map['name'],
      phone: map['phone'],
      nationalId: map['nationalId'],
      resume: map['resume'],
      image: map['imageurl'],
      schedule: map['schedule'],
      country: map['country'],
      psychologist: map['psychologist']

    );
  }

  ////Sending Data From Server/////////////
  Map<String, dynamic> toMap() {
    return {
      'uid':uid,
      'email': email,
      'password':password,
      'name': name,
      'phone': name,
      'nationalId': name,
      'resume': name,
      'country': name,
      'imageurl': name,
      'schedule': name,
      'psychologist':psychologist
    };
  }
}
/////////////////////////////////////////////////////////////////////////////////////////


class PsychologistModel {

  String? psychologist;

  PsychologistModel({this.psychologist});

///////Receive Data From Server/////////////
  factory PsychologistModel.fromMap(map){
    return PsychologistModel(

        psychologist: map['psychologist']

    );
  }

  ////Sending Data From Server/////////////
  Map<String, dynamic> toMap() {
    return {

      'psychologist':psychologist
    };
  }
}
