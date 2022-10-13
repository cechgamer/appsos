import 'dart:io';

import 'package:carwash/signup/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPsychologist extends StatefulWidget {
  const SignUpPsychologist({Key? key}) : super(key: key);

  @override
  _SignUpPsychologistState createState() => _SignUpPsychologistState();
}

class _SignUpPsychologistState extends State<SignUpPsychologist> {
  ImagePicker image = ImagePicker();
 String type='Psychologist';
  File? file;
  String url = '';
  File? files;
  String pdfUrl = '';

  // bool Approved = false;

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repeatPassword = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController nationalId = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController schedule = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xf2efefef),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                    child: TabBarView(children: [
                      Center(
//////////////////////////////////////////First Page////////////////////////////////////////////////////////////////////////

                          child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
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
                              padding: const EdgeInsets.only(right: 230.0),
                              child: Text(
                                "Nombre completo",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: name,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Camilo Vaca Castellon',
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
                              padding: const EdgeInsets.only(right: 230.0),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
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
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 230.0),
                              child: Text(
                                "Contraseña",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                obscureText: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                obscureText: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                      Center(
                          child: Container(
                        width: 400,
                        height: 700,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 230.0),
                              child: Text(
                                "País",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                maxLength: 11,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: country,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Bolivia',
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
                              padding: const EdgeInsets.only(right: 200.0),
                              child: Text(
                                "Número de Documento de Identidad",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                maxLength: 14,

                                controller: nationalId,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: '123456789',
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
                              padding: const EdgeInsets.only(right: 240.0),
                              child: Text(
                                "Celular",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                inputFormatters: [
                                  MaskedInputFormatter("+## ### ### ####")
                                ],
                                controller: phone,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: '+123456789',
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
                                "Currículum Vitae",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: GestureDetector(
                                onTap: () async {
                                  getFile();
                                },
                                child: Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.transparent),
                                  child: Center(
                                      child: Text(
                                    'Subir',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 20.0, right: 20),
                            //   child: Text(
                            //
                            //     style: TextStyle(
                            //         color: Color(0xff4465dc),
                            //         fontWeight: FontWeight.w200,
                            //         fontSize: 12),
                            //   ),
                            // ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 160.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4465dc),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 13.0, left: 13),
                              child: TextFormField(
                                inputFormatters: [
                                  MaskedInputFormatter("##:##/##:##")
                                ],
                                keyboardType: TextInputType.phone,

                                maxLength: 14,
                                controller: schedule,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Escribe tu horario de disponibilidad',
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
                      ))
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
                      Fluttertoast.showToast(msg: 'Por favor ingresa un correo electrónico válido');
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
                    } else if (schedule.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Escribe tu horario de disponibilidad');
                    } else if (country.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Escribe tu país');
                    } else if (nationalId.text.isEmpty ||
                        nationalId.text.length < 7) {
                      Fluttertoast.showToast(
                          msg: 'No has ingresado tu número de Documento de Identidad/Deben ser más de 10 dígitos');
                    }
                    RegExp reg = new RegExp(
                        r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
                    if (!reg.hasMatch(phone.text) || phone.text.length < 14) {
                      Fluttertoast.showToast(
                          msg: 'Por favor ingresa un número de celular válido');
                    } else if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9_.]+(.com|.org)")
                            .hasMatch(email.text) &&
                        email.text.isNotEmpty &&file!.path.toString().isNotEmpty&&files!.path.toString().isNotEmpty&&
                        password.text.isNotEmpty &&
                        password.text.length > 6 &&
                        password.text == repeatPassword.text &&
                        name.text.isNotEmpty &&
                        schedule.text.isNotEmpty &&
                        regEx.hasMatch(name.text) &&
                        country.text.isNotEmpty &&
                        nationalId.text.isNotEmpty &&
                        nationalId.text.length >= 7 &&
                        reg.hasMatch(phone.text) &&
                        phone.text.length >= 14) {
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
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  getFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'doc', 'PDF', 'DOC'], type: FileType.custom);
    if (result == null) {
      return ('File is null');
    }
    final path = result.files.single.path;
    setState(() {
      files = File(path!);
    });
  }

  uploadFile() async {
////For image uploading///////////////////////////////////////////
    final imageFile =
        FirebaseStorage.instance.ref().child("path1").child(file!.path);
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();

////////////For File Uploading////////////////////////////////////
    final filePdf =
        FirebaseStorage.instance.ref().child("path2").child(files!.path);
    UploadTask tasks = filePdf.putFile(files!);
    TaskSnapshot snapshots = await tasks;
    pdfUrl = await snapshots.ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection("PsychologistData")
        .doc(email.text)
        .set({
      'resume': pdfUrl,
      "imageurl": url,
      'name': name.text,
      'email': email.text,
      "password": password.text,
      "repeatPassword": repeatPassword.text,
      "country": country.text,
      "nationalId": nationalId.text,
      "phone": phone.text,
      "schedule": schedule.text,
      'Psychologist':type,
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
