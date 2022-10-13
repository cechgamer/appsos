import 'package:carwash/Model/citizenModel.dart';
import 'package:carwash/Model/user_model.dart';
import 'package:carwash/admin/Ciizendata.dart';
import 'package:carwash/citizan/CitizenHome.dart';
import 'package:carwash/psychologist/PsychologistScreen.dart';
import 'package:carwash/psychologist/SychologistHome.dart';
import 'package:carwash/signup/signupPsychologist.dart';
import 'package:carwash/signup/signupCitizen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xf2efefef),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, right: 200, left: 20),
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
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '            Hola\n Inicia sesión en tu cuenta',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff4465dc),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/userprofile.jpg'),
                        maxRadius: 55,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                     /* Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffe2d2d2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('User Name')),
                      ),
                      SizedBox(
                        height: 30,
                      ),*/
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Por favor selecciona"),
                                    content: Text(
                                        'Ingresa con tu correo electrónico y contraseña'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PsychologistLogin()));
                                          },
                                          child: Text("Psicólogo")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CitizenSignIn()));
                                          },
                                          child: Text("Ciudadano"))
                                    ],
                                  ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 40, left: 50, right: 50),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x9ab89191),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Continuar',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Por favor selecciona"),
                            content: Text(
                                'Ingresa con tu correo electrónico y contraseña'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PsychologistLogin()));
                                  },
                                  child: Text("Psicólogo")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CitizenSignIn()));
                                  },
                                  child: Text("Ciudadano"))
                            ],
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffa1a1a1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                      ),
                      /*child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Login with another account',
                          style: TextStyle(
                            color: Color(0xff4465dc),
                          ),
                        ),
                      )),*/
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpCitizen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffa1a1a1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Crear una cuenta Ciudadano',
                          style: TextStyle(
                            color: Color(0xff4465dc),
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPsychologist()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffa1a1a1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Crear una cuenta Psicólogo',
                          style: TextStyle(
                            color: Color(0xff4465dc),
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class PsychologistLogin extends StatefulWidget {
  const PsychologistLogin({Key? key}) : super(key: key);

  @override
  _PsychologistLoginState createState() => _PsychologistLoginState();
}

class _PsychologistLoginState extends State<PsychologistLogin> {
  TextEditingController emails = new TextEditingController();
  TextEditingController passwords = new TextEditingController();
  String emaila = 'appsos@mial.com';
  String passworda = 'admin9912';
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final storage = FlutterSecureStorage();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf2efefef),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 210),
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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()));
                                  },
                                  icon: Icon(Icons.arrow_back_ios_rounded),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Inicia sesión si tienes una cuenta",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 13.0, left: 13),
                            child: TextFormField(
                              onSaved: (value) {
                                emails.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Por favor ingresa tu correo electrónico");
                                }
                                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9_.]")
                                    .hasMatch(value)) {
                                  return ("Por favor ingresa una expresión válida");
                                }
                              },
                              controller: emails,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true, fillColor: Colors.white,
                                hintText: 'example@mail.com',
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
                          Text(
                            "Contraseña",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 13.0, left: 13),
                            child: TextFormField(
                              obscureText: true,
                              onSaved: (value) {
                                passwords.text = value!;
                              },
                              validator: (value) {
                                RegExp regEx = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("La contraseña es necesaria para iniciar sesión");
                                }
                                if (!regEx.hasMatch(value)) {
                                  return ("Por favor ingresa una contraseña válida (Mínimo 6 caracteres)");
                                }
                              },
                              controller: passwords,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true, fillColor: Colors.white,

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
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (emails.text == emaila ||
                                  passwords.text == passworda) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CitizenData()));
                              }

                              psychoSignIn(emails.text+'P', passwords.text);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 40, left: 50, right: 50),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0x9ab89191),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Continuar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void psychoSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(
              email: emails.text, password: passwords.text)
          .then((uid) => {
        //          if(user!.email!.endsWith('p')){
        //
        //
        //          }
        //
        // else{
        //              Fluttertoast.showToast(msg: 'Wrong Id or Password '),
        //
        //            }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
                     builder: (context) => PsychologistScreen())),
                 Fluttertoast.showToast(msg: 'Inicio de sesión exitoso'),
      });

      await storage.write(
        key: 'uid',
        value: _auth.currentUser?.uid,
      );
    }
  }
}

///////////////////////////////////////////////////////////////Psychologist//////////////////////////////////////////////
class CitizenSignIn extends StatefulWidget {
  const CitizenSignIn({Key? key}) : super(key: key);

  @override
  _CitizenSignInState createState() => _CitizenSignInState();
}

class _CitizenSignInState extends State<CitizenSignIn> {
  TextEditingController emails = new TextEditingController();
  TextEditingController passwords = new TextEditingController();
  String emaila = 'appsos@mial.com';
  String passworda = 'admin9912';
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final storage = FlutterSecureStorage();
  User? user = FirebaseAuth.instance.currentUser;
  CitizenUserModel citizenUserModel = CitizenUserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf2efefef),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 210),
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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()));
                                  },
                                  icon: Icon(Icons.arrow_back_ios_rounded),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Inicia sesión si tienes una cuenta",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 13.0, left: 13),
                            child: TextFormField(
                              controller: emails,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true, fillColor: Colors.white,
                                hintText: 'ejemplo@mail.com',
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
                          Text(
                            "Contraseña",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 13.0, left: 13),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwords,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true, fillColor: Colors.white,

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
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () async {
                                if (emails.text == emaila ||
                                    passwords.text == passworda) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CitizenData()));
                                }
                                citiSignIn(emails.text, passwords.text);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 40, left: 50, right: 50),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0x9ab89191),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Continuar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                                ),
                              ))
                        ],
                      ),
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

  void citiSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(
              email: emails.text, password: passwords.text)
          .then((uid) => {


      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CitizenHome())),
                  Fluttertoast.showToast(msg: 'Inicio de sesión exitoso'),
              });

      await storage.write(
        key: 'uid',
        value: _auth.currentUser?.uid,
      );
    }
  }
}
