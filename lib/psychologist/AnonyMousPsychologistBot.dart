import 'package:carwash/citizan/CitizenHome.dart';
import 'package:carwash/citizan/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AnonyMousPsychologistBot extends StatefulWidget {
  const AnonyMousPsychologistBot({Key? key}) : super(key: key);

  @override
  _AnonyMousPsychologistBotState createState() =>
      _AnonyMousPsychologistBotState();
}

class _AnonyMousPsychologistBotState extends State<AnonyMousPsychologistBot> {
  TextEditingController call = new TextEditingController(text: '+');
  TextEditingController controller = new TextEditingController();

  void cal(String phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff5f1090),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                  child: Icon(
                Icons.call,
                size: 80,
                color: Colors.white,
              )),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13.0, left: 13),
              child: TextFormField(
                onSaved: (value) {
                  call.text = value!;
                },
                inputFormatters: [MaskedInputFormatter("+## ### ### ####")],
                controller: call,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true, fillColor: Colors.white,
                  hintText: 'Digita el celular del psicólogo al que quieres llamar',
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
            ElevatedButton(
                onPressed: () async {
                  cal(call.text);
                },
                child: Text('Llamar')),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              child: Text(
                "Perfil de Psicólogos",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("PsychologistData")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          return ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              primary: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, i) {
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[i];
                                if (!snapshot.hasData ||
                                    snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, right: 10, left: 10),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(x['imageurl']),
                                            radius: 40,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Nombre completo :${x['name']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                              child: Text(
                                                  "Email:   ${x['email']}")),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Celular: ${x['phone']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Horario: ${x['schedule']}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              'Documento de Identidad: ${x['nationalId']}'),
                                          ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              title: Text(
                                                                  "Escribe las razones de tu denuncia"),
                                                              content:
                                                                  TextFormField(
                                                                controller:
                                                                    controller,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '¿Por qué quieres denunciar?',
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 1,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                    ),
                                                                  ),
                                                                  filled: true,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16),
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                              actions: [
                                                                Center(
                                                                    child: ElevatedButton(
                                                                        onPressed: () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('SychoReports')
                                                                              .doc(x['email'])
                                                                              .set({
                                                                            'reports':
                                                                                controller.text,
                                                                            'resume':
                                                                                x['resume'],
                                                                            "imageurl":
                                                                                x['imageurl'],
                                                                            'name':
                                                                                x['name'],
                                                                            'email':
                                                                                x['email'],
                                                                            "password":
                                                                                x['password'],
                                                                            "country":
                                                                                x['country'],
                                                                            "nationalId":
                                                                                x['nationalId'],
                                                                            "phone":
                                                                                x['phone'],
                                                                            "schedule":
                                                                                x['schedule'],
                                                                            'Psychologist':
                                                                                x['Psychologist'],
                                                                          });
                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (context) => AlertDialog(
                                                                                    title: Text("Reportar"),
                                                                                    content: Text('Tu reporte ha sido enviado.'
                                                                                        ' Los Administradores lo revisarán pronto '),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AnonyMousPsychologistBot()));
                                                                                          },
                                                                                          child: Text("OK"))
                                                                                    ],
                                                                                  ));
                                                                        },
                                                                        child: Text('Reportar')))
                                                              ],
                                                            ));
                                              },
                                              child:
                                                  Text("Reportar Psicólogo"))
                                        ],
                                      ),
                                    ));
                              });
                        }),
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ]),
        ));
  }
}
// FirebaseFirestore.instance.collection('SychoReports').doc(x['email']).set(
// {
//
// 'resume': x['resume'],
// "imageurl": x['imageurl'],
// 'name':x['name'],
// 'email': x['email'],
// "password": x['password'],
// "country": x['country'],
// "nationalId": x['nationalId'],
// "phone": x['phone'],
// "schedule": x['schedule'],
// 'Psychologist':x['Psychologist'],
// // 'Approved': Approved,
// }
// );
// showDialog(
// context: context,
// builder: (context) => AlertDialog(
// title: Text("Report"),
// content: Text('Your report against Psychologist has been sent '
// 'Admin will soon check it '),
// actions: [
// TextButton(
// onPressed: () {
// Navigator.of(context).pop();
// },
// child: Text("OK"))
// ],
// ));
