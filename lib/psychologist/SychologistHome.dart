import 'dart:io';

import 'package:carwash/Model/user_model.dart';
import 'package:carwash/signup/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SychologistHome extends StatefulWidget {
  const SychologistHome({Key? key}) : super(key: key);

  @override
  _SychologistHomeState createState() => _SychologistHomeState();
}

class _SychologistHomeState extends State<SychologistHome> {
  UserModel loggedInUser=new UserModel();
  User? user = FirebaseAuth.instance.currentUser;
 TextEditingController controller=TextEditingController();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('PsychologistData')
        .doc(user!.email)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(children:[

          Center(
              child: Column(
                children: [
                  Text(
                    'Please Enter Valid email for Psychologist account \nthat '
                        'email you enter its Citizen  email',
                    style:
                    TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
               
                ],
              )),
          SizedBox(height: 30,),
          SizedBox(height: 30,child: Text("Citizen Profiles",style: TextStyle(color: Colors.white),),),
          Column(children: [
            SingleChildScrollView(
              child: Column(children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("CitizenData")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            QueryDocumentSnapshot x = snapshot.data!.docs[i];
                            if (!snapshot.hasData ||
                                snapshot.connectionState ==
                                    ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, right: 10, left: 10),
                                child: Card(
                                  child: Column(children: [
                                    SizedBox(height: 10,),

                                    CircleAvatar(backgroundImage:NetworkImage(x['ImageUrl']) ,radius: 40,),
                                    SizedBox(height: 10,),
                                    Text("Name :${x['name']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5,),

                                    Center(child: Text("Email:   ${x['email']}")),
                                    SizedBox(height: 5,),

                                    Text("Contact: ${x['phone']}"),
                                    SizedBox(height: 5,),
                                    Text('Country: ${x['country']}'),
                                    SizedBox(height: 5,),
                                    Text('National ID: ${x['nationalId']}'),


                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       showDialog(context: context, builder: (context)=>AlertDialog(
                                    //         title: Text("Tell us Why"),
                                    //         content: TextFormField(
                                    //
                                    //           controller: controller,
                                    //           textAlign: TextAlign.center,
                                    //           keyboardType: TextInputType.text,
                                    //           decoration: InputDecoration(
                                    //             hintText: 'Tell us Why',
                                    //             border: OutlineInputBorder(
                                    //               borderRadius: BorderRadius.circular(12),
                                    //               borderSide: BorderSide(
                                    //                 color: Colors.white,
                                    //                 width: 1,
                                    //                 style: BorderStyle.solid,
                                    //               ),
                                    //             ),
                                    //             filled: true,
                                    //             contentPadding: EdgeInsets.all(16),
                                    //             fillColor: Colors.white,
                                    //           ),
                                    //         ),
                                    //         actions: [
                                    //           Center(child: ElevatedButton(onPressed: (){
                                    //
                                    //
                                    //
                                    //             FirebaseFirestore.instance.collection('CitiReports').doc(x['email']).set(
                                    //                 {
                                    //                   'reports':controller.text,
                                    //                   "ImageUrl": x['ImageUrl'],
                                    //                   'name':x['name'],
                                    //                   'email': x['email'],
                                    //                   "country": x['country'],
                                    //                   "nationalId": x['nationalId'],
                                    //                   "phone": x['phone'],
                                    //
                                    //
                                    //                 }
                                    //             );
                                    //             showDialog(
                                    //                 context: context,
                                    //                 builder: (context) => AlertDialog(
                                    //                   title: Text("Report"),
                                    //                   content: Text('Your report against Psychologist has been sent '
                                    //                       'Admin will soon check it '),
                                    //                   actions: [
                                    //                     TextButton(
                                    //                         onPressed: () {
                                    //                           Navigator.of(context).pop();
                                    //                         },
                                    //                         child: Text("OK"))
                                    //                   ],
                                    //                 ));
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //           }, child: Text('Report')))
                                    //         ],
                                    //       ));
                                    //     },
                                    //     child:
                                    //     Text("Report Psychologist"))

                                  ],),
                                )
                            );
                          });
                    }),

              ]),
            ),
            SizedBox(height: 30,),
          ],)
        ]),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////////////











class EditPsychologist extends StatefulWidget {
  const EditPsychologist({Key? key}) : super(key: key);

  @override
  _EditPsychologistState createState() => _EditPsychologistState();
}

class _EditPsychologistState extends State<EditPsychologist> {
  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController country=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController id=new TextEditingController();
  TextEditingController schedule=new TextEditingController();
  TextEditingController schedule1=new TextEditingController();

  ImagePicker image = ImagePicker();
  File? file;
  String url = '';
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('PsychologistData')
        .doc(user!.email)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff5f1090),

        body: Container(
          child: SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Center(
                  child: GestureDetector(
                      onTap: () async {
                        getImage();
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                        backgroundColor: Color(0xffe4edfc),
                        radius: 60,
                        backgroundImage: file == null
                            ? AssetImage('')
                            : FileImage(File(file!.path))
                        as ImageProvider,
                      )),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Fluttertoast.showToast(msg: 'Por favor espera');
                  uploadImage();
                }, child: Text("Actualizar")),
                SizedBox(height: 20,),

                SizedBox(height: 20,),

                Text('Nombre completo actual:: ${loggedInUser.name}',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                TextFormField( enableSuggestions: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: name,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),  SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  RegExp regEx = new RegExp(r'^.{3,}$');
                  if(name.text.isNotEmpty&&regEx.hasMatch(name.text)) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'Nombre':name.text});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),
                SizedBox(height: 10,),
                Text('Celular actual:: ${loggedInUser.phone}',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                TextFormField( enableSuggestions: true,
                  inputFormatters: [
                    MaskedInputFormatter("+## ### ### ####")
                  ],
                  controller: phone,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if(phone.text.isNotEmpty) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'Celular': phone.text});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),
                SizedBox(height: 10,),
                Text('Contraseña actual:: ${loggedInUser.password}',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                TextFormField( enableSuggestions: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: password,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),  SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  user!.updatePassword(password.text);

                  if(password.text.isNotEmpty && password.text.length > 6 ) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'Contraseña': password.text});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),

                SizedBox(height: 20,),

                SizedBox(height: 10,),
                Text('Número de Documento de Identidad:: ${loggedInUser.nationalId}',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                TextFormField( enableSuggestions: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: id,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if(id.text.isNotEmpty&&id.text.length>7) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'Número de Documento de Identidad': id.text});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),
                Text('País:: ${loggedInUser.country}',style: TextStyle(color: Colors.white),),

                SizedBox(height: 10,),
                TextFormField( enableSuggestions: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: country,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if(country.text.isNotEmpty&&id.text.length>7) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'País': country.text});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),
                //////////////////////
                SizedBox(height: 10,),
                TextFormField(
                  inputFormatters: [
                    MaskedInputFormatter("##:##/##:##")
                  ],


                  maxLength: 14,

                  enableSuggestions: true,

                  controller: schedule,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  inputFormatters: [
                    MaskedInputFormatter("##:##/##:##")
                  ],


                  maxLength: 14,

                  enableSuggestions: true,

                  controller: schedule1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Actualizar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // filled: true,
                    // contentPadding: EdgeInsets.all(16),
                    // fillColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if(schedule.text.isNotEmpty) {
                    var collection = FirebaseFirestore.instance.collection(
                        'PsychologistData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'Horario de Atención': schedule.text+',${schedule1.text}'});
                    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
                  }
                  return null;
                },child: Text("Actualizar"),),
                SizedBox(height: 20,),
              ],),
          ),
        ));
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
  uploadImage()async{
    final imageFile =
    FirebaseStorage.instance.ref().child("path4").child(file!.path);
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection("PsychologistData").doc(loggedInUser.email).update({
      'imageurl':url
    });
    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
  }



}

