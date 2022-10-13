import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  PrivacyModel privacyModel = new PrivacyModel();
  TextEditingController pPhone = TextEditingController();
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('privacyPhone')
        .doc('newPh')
        .get()
        .then((value) {
      this.privacyModel = PrivacyModel.fromMap(value.data());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1a1192),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Privacidad',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.sd_card_alert_sharp,
                      color: Colors.white,
                      size: 60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Selecciona qué información quieres que aparezca en la alerta:",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 220,
                  height: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: a,
                              onChanged: (v) {
                                setState(() {
                                  a = 1;
                                });
                              }),
                          Text(
                            "Mostrar foto de perfil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: b,
                              onChanged: (v) {
                                setState(() {
                                  b = 2;
                                });
                              }),
                          Text(
                            "Mostrar nombre",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 3,
                              groupValue: c,
                              onChanged: (v) {
                                setState(() {
                                  c = 3;
                                });
                              }),
                          Text(
                            "Mostrar foto de perfil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 4,
                              groupValue: d,
                              onChanged: (v) {
                                setState(() {
                                  d = 4;
                                });
                              }),
                          Text(
                            "Mostrar CI",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              a = 0;
                              b = 0;
                              c = 0;
                              d = 0;
                            });
                          },
                          child: Text(
                            'Limpiar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 45,
                  color: Colors.white,
                  child: TextFormField(
                    inputFormatters: [MaskedInputFormatter("+## ### ### ####")],
                    controller: pPhone,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: '+123456789',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white,
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
                  height: 20,
                ),
                Text("Ya seleccionaste este número:",style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Celular: ${privacyModel.phone} ",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('privacyPhone')
                          .doc('newPh')
                          .set({'phone': pPhone.text});
                      Fluttertoast.showToast(msg: 'Tu información ha sido guardada');
                    },
                    child: Container(
                      color: Colors.white,
                      width: 120,
                      height: 40,
                      child: Center(child: Text("Guardar")),
                    ))
              ],
            ),
          ),
        ));
  }
}

class PrivacyModel {
  String? phone;

  PrivacyModel({this.phone});

///////Receive Data From Server/////////////
  factory PrivacyModel.fromMap(map) {
    return PrivacyModel(phone: map['phone']);
  }

  ////Sending Data From Server/////////////
  Map<String, dynamic> toMap() {
    return {'Celular': phone};
  }
}
