
import 'package:carwash/Model/citizenModel.dart';
import 'package:carwash/citizan/CitizenHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivationMethod extends StatefulWidget {

  const ActivationMethod({Key? key}) : super(key: key);

  @override
  _ActivationMethodState createState() => _ActivationMethodState();
}

class _ActivationMethodState extends State<ActivationMethod> {
 String value = '';
 CitizenUser citizenUser=new CitizenUser();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('action')
        .doc('new')
        .get()
        .then((value) {
      this.citizenUser= CitizenUser.fromMap(value.data());

      setState(() {});
    });


  }
  String a='a';
String newa='';
  List<String> panic = <String>[
    'Presiona los dos botones de volumen por 3 segundos',
    'Presiona el botón de apagado con el botón de subir volumen por 3 segundos'
  ];

  String newPanicValue = 'Presiona los dos botones de volumen por 3 segundos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5f1090),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Metodo the activation',
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 330,
              height: 40,
              color: Colors.white,
              child: DropdownButton<String>(
                onChanged: (String? newValue){
                  setState(() {
                    newPanicValue = newValue!;
                       newa=newValue;
                  });
                },
                onTap: (){
                  },
                isExpanded: true,
                value: newPanicValue,
                items: panic.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 50,),

            Text(" Tu método seleccionado ",style: TextStyle(color: Colors.white),),
      SizedBox(height: 10,),
              Text(  "${citizenUser.action}",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500,fontSize: 17),),
          SizedBox(height: 160,),


          GestureDetector(
              onTap: () async {
                   FirebaseFirestore.instance.collection('action').doc('new').set({
                     'action':newa
                   });
                Fluttertoast.showToast(msg: 'Datos guardados');
              },
              child: Container(
                width: 200,
                height: 40,
                child: Center(child: Text("Guardar")),
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
