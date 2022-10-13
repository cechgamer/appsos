import 'package:carwash/Model/user_model.dart';
import 'package:carwash/signup/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SychologistHome.dart';

class PsychologistScreen extends StatefulWidget {
  const PsychologistScreen({Key? key}) : super(key: key);

  @override
  _PsychologistScreenState createState() => _PsychologistScreenState();
}

class _PsychologistScreenState extends State<PsychologistScreen> {
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
      if (loggedInUser.psychologist != '') setState(() {});
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds:800), () =>mover());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5f1090),

      appBar: AppBar( backgroundColor: Colors.white,
        title: Text("Hola, ${loggedInUser.name}",style: TextStyle(color: Colors.black),), centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [

                 SizedBox(height: 30,),
                  Center(child: CircleAvatar(backgroundImage: NetworkImage('${loggedInUser.image}'),radius: 50,)),
                  SizedBox(height: 20,),

                  Text("Nombre completo: ${loggedInUser.name}",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("Email: ${loggedInUser.email}",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("Horario: ${loggedInUser.schedule}",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("País: ${loggedInUser.country}",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                  Text("Documento de Identidad: ${loggedInUser.nationalId}",style: TextStyle(color: Colors.white),),
                  SizedBox(height: 60,),
                 Row( mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      // ElevatedButton(onPressed: (){
                      //
                      //
                      //
                      //     Navigator.push(context, MaterialPageRoute(
                      //         builder: (context) => SychologistHome()));
                      //
                      // }, child: Text("Citizen Profiles")),
                      SizedBox(width: 20,),
                      ElevatedButton(onPressed: (){

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EditPsychologist()));

                      },
                          child: Text("Editar Perfil")),
                 ],),
                  SizedBox(height: 30,),
                  ActionChip(
                      label: Text(
                        "Cerrar Sesión",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Color(0xffEDAA39),
                      onPressed: () {

                        logOut(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  final storage = FlutterSecureStorage();

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await storage.delete(key: 'uid');
    await storage.delete(key: 'email');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }

  mover()async{
    if(loggedInUser.email==null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PsychologistLogin()));
      Fluttertoast.showToast(msg: 'Tú no eres Psicólogo\n Error de red');
    }
    return null;
  }
}
