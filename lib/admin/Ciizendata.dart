import 'package:carwash/Model/citizenModel.dart';
import 'package:carwash/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'homepage.dart';

class CitizenData extends StatefulWidget {
  const CitizenData({Key? key}) : super(key: key);

  @override
  _CitizenDataState createState() => _CitizenDataState();
}

class _CitizenDataState extends State<CitizenData> {
  final _auth = FirebaseAuth.instance;
    CitizenUserModel citizenUserModel=new CitizenUserModel();
    UserModel userModel=new UserModel();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Color(0xf2efefef),
            body: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                  padding: const EdgeInsets.only(top: 50.0,),
                  child: Row(
                    children: [
                      Container(
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
                      SizedBox(width:200,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff2e38f8),
                        ),
                        width: 85,
                        height: 35,
                        child: Center(
                          child: TextButton(


                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PsychologistReports()));
                            },
                            child: Text("Reportes"),
                          ),
                        ),
                      ),
                    ],
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
                            text: 'Ciudadanos',
                          ),
                          Tab(
                            text: 'Psicólogos',
                          ),
                        ]),
                  ),
                    ),
                    SizedBox(
                    height: 710,
                    child: TabBarView(children: [
                      Center(
//////////////////////////////////////////First Page///////////////////// ///////////////////////////////////////////////////

                          child: SingleChildScrollView(
                            child: Container( 
                                color: Colors.white,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("CitizenData")
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          return ListView.builder(
                                              physics: ScrollPhysics(),
                                              shrinkWrap: true,
                                              primary: true,
                                              itemCount: snapshot
                                                  .data!.docs.length,
                                              itemBuilder: (context, i) {
                                                QueryDocumentSnapshot x =
                                                    snapshot.data!.docs[i];
                                                if (!snapshot.hasData ||
                                                    snapshot.connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                return Card(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                        Text(
                                                            "Nueva solicitud de creación de cuenta:: ${x['name']}"),
                                                        CircleAvatar(
                                                          radius: 50,
                                                          backgroundImage:
                                                              NetworkImage(x[
                                                                  'ImageUrl']),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x['name']),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["email"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["password"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x[
                                                            "repeatPassword"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["country"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["nationalId"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["phone"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(x["age"]),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "CitizenData")
                                                                      .doc(x[
                                                                          'email'])
                                                                      .delete();
                                                                },
                                                                child: Text(
                                                                    "Eliminar")),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  await _auth
                                                                      .createUserWithEmailAndPassword(
                                                                          email: x[
                                                                              'email'],
                                                                          password: x['password'])
                                                                      .then((value) async =>
                                                                          {

                                                                           Fluttertoast.showToast(msg: 'Exitoso')
                                                                          })
                                                                      .catchError(
                                                                          (e) {
                                                                    Fluttertoast.showToast(
                                                                        msg: e!
                                                                            .message);
                                                                  });
                                                                },
                                                                child: Text(
                                                                    "Aceptar")),
                                                          ],
                                                        ),

                                                        SizedBox(
                                                          height: 300,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }),
                                  ]),
                                )),
                          )),
                      //////////////////////////////////////////////////////////////////////////////////////
                      Container(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("PsychologistData")
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot>
                                          snapshot) {
                                    return ListView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: true,
                                        itemCount:
                                            snapshot.data!.docs.length,
                                        itemBuilder: (context, i) {
                                          QueryDocumentSnapshot x =
                                              snapshot.data!.docs[i];
                                          if (!snapshot.hasData ||
                                              snapshot.connectionState ==
                                                  ConnectionState
                                                      .waiting) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(
                                                    top: 30.0,
                                                    right: 10,
                                                    left: 10),
                                            child: Card(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                        "Nueva solicitud de creación de cuenta: ${x['name']}"),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 50,
                                                      backgroundImage:
                                                          NetworkImage(x[
                                                              'imageurl']),
                                                    ),
                                                    Text(x['name']),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["email"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["password"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x[
                                                        "repeatPassword"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["country"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["nationalId"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["phone"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(x["schedule"]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                      child: Card(
                                                          child:
                                                              TextButton(
                                                        onPressed:
                                                            () async {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Scaffold(
                                                                        backgroundColor: Color(0xff4465dc),
                                                                        appBar: AppBar(
                                                                          backgroundColor: Color(0xff4465dc),
                                                                          title: const Text('Currículum Vitae'),
                                                                        ),
                                                                        body: const PDF().cachedFromUrl(
                                                                          x['resume'],
                                                                          placeholder: (double progress) => Center(child: Text('$progress %')),
                                                                          errorWidget: (dynamic error) => Center(child: Text(error.toString())),
                                                                        ),
                                                                      )));
                                                        },
                                                        child: Text(
                                                            "CV"),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "PsychologistData")
                                                                  .doc(x[
                                                                      'email'])
                                                                  .delete();
                                                            },
                                                            child: Text(
                                                                "Eliminar")),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await _auth
                                                                  .createUserWithEmailAndPassword(
                                                                      email: x[
                                                                          'email'],
                                                                      password: x[
                                                                          'password'])
                                                                  .then((value) async =>
                                                                      {
                                                                        Fluttertoast.showToast(msg: 'Exitoso')


                                                                      })
                                                                  .catchError(
                                                                      (e) {
                                                                Fluttertoast.showToast(
                                                                    msg: e!
                                                                        .message);
                                                              });
                                                            },
                                                            child: Text(
                                                                "Aceptar")),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                            ]),
                          ))
                    ]))
                  ]),
                ))));
  }

}
