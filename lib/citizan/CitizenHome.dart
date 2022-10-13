import 'dart:async';

import 'package:carwash/Model/citizenModel.dart';
import 'package:carwash/citizan/Privacy.dart';

import 'package:carwash/citizan/activation%20method.dart';
import 'package:carwash/citizan/alert.dart';
import 'package:carwash/psychologist/AnonyMousPsychologistBot.dart';
import 'package:carwash/psychologist/ChatBody.dart';
import 'package:carwash/signup/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'EditCitizen.dart';

class CitizenHome extends StatefulWidget {
  const CitizenHome({Key? key}) : super(key: key);

  @override
  _CitizenHomeState createState() => _CitizenHomeState();
}

class _CitizenHomeState extends State<CitizenHome> {
  TextEditingController pPhone = TextEditingController();
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  User? user = FirebaseAuth.instance.currentUser;
  CitizenUserModel loggedInUser = CitizenUserModel();
  List<String> tools = <String>['tus herramientas', 'sobre nosotros', 'ajustes de cuenta'];
  List<String> panic = <String>[
    'Presiona los dos botones de volumen por 3 segundos',
    'Presiona el botón de apagado con el botón de subir volumen por 3 segundos'
  ];

  String? dropValue = 'tus herramientas';
  String? newpanicValue = 'Presiona los dos botones de volumen por 3 segundos';

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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 800), () => mover());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hola, ${loggedInUser.name}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.black54,
        ),
        backgroundColor: Color(0xff5f1090),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 200,
                          color: Colors.white,
                          child: DropdownButton<String>(
                            onChanged: (String? newValue) {
                              setState(() {
                                dropValue = newValue!;
                                if (dropValue.toString().contains('cuenta')) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditCitizen()));
                                } else if (dropValue
                                    .toString()
                                    .contains('sobre nosotros')) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                            body: Container(
                                              color: Color(0xff5f1090),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Text(
                                                    " APPSOS"
                                                        " Aplicación móvil para resguardar"
                                                        " tu salud física, sexual y"
                                                        " psicológica. "
                                                    ,style: TextStyle(color: Colors.white),),
                                                ),
                                              ),
                                            ),
                                          )));
                                }
                              });
                            },
                            onTap: () {},
                            isExpanded: true,
                            value: dropValue,
                            items: tools
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage('${loggedInUser.image}'),
                        radius: 60,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
/////////////////////////////////////////////////////////////////////////////////Panic//////////////////////
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                backgroundColor: Color(0xff5f1090),
                                body: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Configuración del \n       Botón de Pánico',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        Icon(
                                          Icons.sd_card_alert_sharp,
                                          color: Colors.white,
                                          size: 60,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),

/////////////////////////////////////////////////////////////////////Activation method//////////////////////////////////////
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActivationMethod()));
                                        },
                                        child: Container(
                                          width: 220,
                                          height: 80,
                                          child: Center(
                                              child: Text("Método de Activación")),
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      height: 50,
                                    ),
//////////////////////////////////////////////////////////////////////////////////////alert//////////////////////////////////////
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Alerts()));
                                        },
                                        child: Container(
                                          width: 220,
                                          height: 80,
                                          child: Center(child: Text("Alerta")),
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      height: 50,
                                    ),
////////////////////////////////////////////////////////////////////Privacy////////////////////////////////////////////////////////
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Privacy()));
                                        },
                                        child: Container(
                                          width: 220,
                                          height: 80,
                                          child: Center(child: Text("Privacidad")),
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ));
                      },
                      child: Container(
                        width: 220,
                        height: 80,
                        child:
                        Center(child: Text("Configuración del Botón de Pánico")),
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 70,
                  ),
///////////////////////////////////////////////////////////////////////////Psychology bot//////////////////////////////////////
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Container(
                        width: 220,
                        height: 80,
                        child: Center(child: Text("Bot Psicólogo")),
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 70,
                  ),
/////////////////////////////////////////////////////////////////////////////////Psychologist////////////////////////////////////
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AnonyMousPsychologistBot()));
                      },
                      child: Container(
                        width: 220,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Center(
                              child: Text("Llamadas a Psicólogos")),
                        ),
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ActionChip(
                      label: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Color(0xffEDAA39),
                      onPressed: () {
                        logOut(context);
                      }),
                ]),
              ),
            ],
          ),
        ));
  }

  final storage = FlutterSecureStorage();

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await storage.delete(key: 'uid');
    await storage.delete(key: 'email');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }

  mover() async {
    if (loggedInUser.email == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CitizenSignIn()));
      Fluttertoast.showToast(msg: 'Contraseña o email incorrecto');
    }
    return null;
  }
}
