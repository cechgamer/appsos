import 'dart:io';
import 'package:carwash/Model/citizenModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditCitizen extends StatefulWidget {
  const EditCitizen({Key? key}) : super(key: key);

  @override
  _EditCitizenState createState() => _EditCitizenState();
}

class _EditCitizenState extends State<EditCitizen> {
  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController country=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController id=new TextEditingController();

  ImagePicker image = ImagePicker();
  File? file;
  String url = '';
  User? user = FirebaseAuth.instance.currentUser;
  CitizenUserModel loggedInUser = CitizenUserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('CitizenData')
        .doc(user!.email)
        .get()
        .then((value) {
      this.loggedInUser = CitizenUserModel.fromMap(value.data());

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

                Text('Nombre Completo Actual:: ${loggedInUser.name}',style: TextStyle(color: Colors.white),),
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
                        'CitizenData');
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
                        'CitizenData');
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
                        'CitizenData');
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
                  if(id.text.isNotEmpty) {
                    var collection = FirebaseFirestore.instance.collection(
                        'CitizenData');
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
                ),
                SizedBox(height: 10,),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if(country.text.isNotEmpty) {
                    var collection = FirebaseFirestore.instance.collection(
                        'CitizenData');
                    collection
                        .doc(loggedInUser.email)
                      ..update({'País': country.text});
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
    FirebaseStorage.instance.ref().child("path3").child(file!.path);
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection("CitizenData").doc(loggedInUser.email).update({
      'ImageUrl':url
    });
    Fluttertoast.showToast(msg: 'Actualizado, vuelve a ingresar para ver los cambios');
  }



}
