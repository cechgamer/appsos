import 'dart:io';

import 'package:carwash/signup/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:image_picker/image_picker.dart';
class SignUpCitizen extends StatefulWidget {
  const SignUpCitizen({Key? key}) : super(key: key);

  @override
  _SignUpCitizenState createState() => _SignUpCitizenState();
}

class _SignUpCitizenState extends State<SignUpCitizen> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repeatPassword = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController idNumber = new TextEditingController();
  TextEditingController phone = new TextEditingController(text: '+');

  ImagePicker image = ImagePicker();
 String type='Citizen';
  File? file;
  String url = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xf2efefef),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, right: 280),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff2e38f8),
                      ),
                      width: 35,
                      height: 35,
                      child: Center(
                        child: IconButton(
                          color: Colors.white,
                          iconSize: 17,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffa1a1a1),
                          width: 1,
                        ),
                      ),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: Color(0xff4465dc),
                          indicator: BoxDecoration(
                            color: Color(0xff4465dc),
                          ),
                          tabs: [
                            Tab(
                              text: 'Uno',
                            ),
                            Tab(
                              text: 'Dos',
                            ),
                          ]),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 610,
                      child: TabBarView(children: <Widget>[
                        Center(
//////////////////////////////////////////First Page////////////////////////////////////////////////////////////////////////

                            child: Container(

                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
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
                              Text('Seleccionar foto de perfil'),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 230.0, bottom: 0, left: 0, top: 0),
                                child: Text(
                                  "Nombre completo",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff4465dc),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 13.0, left: 13),
                                child: TextFormField( enableSuggestions: true,
                                  textCapitalization: TextCapitalization.sentences,
                                  controller: name,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Sofia Paredes Meneses',
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 230.0, bottom: 0, left: 0, top: 0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff4465dc),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 13.0, left: 13),
                                child: TextFormField(
                                  controller: email,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'ejemplo@gmail.com',
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 230.0, left: 0, top: 0, bottom: 0),
                                child: Text(
                                  "Contraseña",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff4465dc),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 13.0, left: 13),
                                child: TextFormField(
                                  obscureText: true,
                                  textCapitalization: TextCapitalization.sentences,
                                  controller: password,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
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
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 160.0),
                                child: Text(
                                  "Confirma tu contraseña",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff4465dc),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 13.0, left: 13),
                                child: TextFormField(
                                  obscureText: true,
                                  textCapitalization: TextCapitalization.sentences,
                                  controller: repeatPassword,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
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
                              ),
                            ],
                          ),
                        )),
//////////////////////////////////////////Second Page////////////////////////////////////////////////////////////////////////
                        Column(
                          children: <Widget>[
                            Center(
                                child: Container(

                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 50,),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 230.0),
                                    child: Text(
                                      "Edad",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff4465dc),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 13.0, left: 13),
                                    child: TextFormField(
                                      maxLength: 2,
                                      controller: age,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '21',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 230.0),
                                    child: Text(
                                      "País",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff4465dc),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 13.0, left: 13),
                                    child: TextFormField(
                                      textCapitalization: TextCapitalization.sentences,
                                      maxLength: 11,
                                      controller: country,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Bolivia',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 110.0),
                                    child: Text(
                                      "Número de Documento de Identidad",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff4465dc),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 13.0, left: 13),
                                    child: TextFormField(

                                      maxLength: 14,
                                      controller: idNumber,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '123456789',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 240.0),
                                    child: Text(
                                      "Celular",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff4465dc),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 13.0, left: 13),
                                    child: TextFormField(
                                      // maxLength: 12,
                                      inputFormatters: [
                                        MaskedInputFormatter("+## ### ### ####")
                                      ],
                                      controller: phone,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: '+123456789',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                  ),
                                  SizedBox(height: 70,),
                                ],
                              ),
                            )),


                          ],
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9_.]+(.com|.org)")
                              .hasMatch(email.text) ||
                          email.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Por favor ingresa un correo electrónico válido');
                      } else if (password.text.isEmpty ||
                          password.text.length < 6) {
                        Fluttertoast.showToast(msg: 'Por favor ingresa una contraseña válida');
                      } else if (password.text != repeatPassword.text) {
                        Fluttertoast.showToast(msg: 'Las contraseñas no son iguales');
                      }
                      RegExp regEx = new RegExp(r'^.{3,}$');
                      if (name.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Ingresa tu nombre completo');
                      } else if (!regEx.hasMatch(name.text)) {
                        Fluttertoast.showToast(
                            msg: 'Ingresa tu nombre completo');
                      } else if (age.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Ingresa tu edad');
                      } else if (country.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Ingresa tu país');
                      }
                      else if (idNumber.text.isEmpty ||
                          idNumber.text.length < 7) {
                        Fluttertoast.showToast(msg: 'No has ingresado tu número de Documento de Identidad/Deben ser más de 10 dígitos');
                      }
                      RegExp reg = new RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
                       if(!reg
                          .hasMatch(phone.text)||phone.text.length<14){
                        Fluttertoast.showToast(msg: 'Por favor ingresa un número de celular válido');
                      }



                      else if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9_.]+(.com|.org)")
                                  .hasMatch(email.text) &&
                              email.text.isNotEmpty &&
                              password.text.isNotEmpty &&
                              password.text.length > 6 &&
                              password.text == repeatPassword.text &&
                              name.text.isNotEmpty &&
                              age.text.isNotEmpty &&
                              regEx.hasMatch(name.text) &&
                              country.text.isNotEmpty &&
                              idNumber.text.isNotEmpty &&
                          idNumber.text.length >= 7&&reg.hasMatch(phone.text)&&phone.text.length>=14) {
                        Fluttertoast.showToast(msg: 'Enviando solicitud...');
                        uploadFile();
                      }
                    },
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff4465dc),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff4465dc),
                      ),
                      child: Center(
                          child: Text(
                        'Crear Cuenta',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    final imageFile =
    FirebaseStorage.instance.ref().child("path1").child(file!.path);
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection("CitizenData").doc(email.text).set({
      'name': name.text,
      'email': email.text,
      "password": password.text,
      "repeatPassword": repeatPassword.text,
      "country": country.text,
      "nationalId": idNumber.text,
      "phone": phone.text,
      "age": age.text,
      'ImageUrl':url,
      'citizen':type
      // 'Approved': Approved,
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Gracias"),
              content: Text('Procesaremos los datos para la creación de tu cuenta. Esto con el fin de brindar una experiencia de seguridad y confianza. '
                  'Esto puede demorar hasta 48 horas. De nuevo, gracias por tu paciencia.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text("OK"))
              ],
            ));
  }
}
