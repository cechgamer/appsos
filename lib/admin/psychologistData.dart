import 'package:carwash/admin/Ciizendata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PsychologistData extends StatefulWidget {
  const PsychologistData({Key? key}) : super(key: key);

  @override
  _PsychologistDataState createState() => _PsychologistDataState();
}

class _PsychologistDataState extends State<PsychologistData> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Nueva solicitud de creación de cuenta: "),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CitizenData()));
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        backgroundColor: Color(0xff4465dc),
        body: SingleChildScrollView(
          child: Column(children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("PsychologistData")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      primary: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        QueryDocumentSnapshot x = snapshot.data!.docs[i];
                        if (!snapshot.hasData ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, right: 10, left: 10),
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Text("Nueva solicitud de creación de cuenta: ${x['name']}"),
                                SizedBox(
                                  height: 20,
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(x['imageurl']),
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
                                Text(x["repeatPassword"]),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                      child: TextButton(
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Scaffold(
                                                    backgroundColor:
                                                        Color(0xff4465dc),
                                                    appBar: AppBar(
                                                      backgroundColor:
                                                          Color(0xff4465dc),
                                                      title: const Text(
                                                          'CV'),
                                                    ),
                                                    body: const PDF()
                                                        .cachedFromUrl(
                                                      x['resume'],
                                                      placeholder: (double
                                                              progress) =>
                                                          Center(
                                                              child: Text(
                                                                  '$progress %')),
                                                      errorWidget: (dynamic
                                                              error) =>
                                                          Center(
                                                              child: Text(error
                                                                  .toString())),
                                                    ),
                                                  )));
                                    },
                                    child: Text("CV"),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          FirebaseFirestore.instance
                                              .collection("PsychologistData")
                                              .doc(x['email'])
                                              .delete();
                                        },
                                        child: Text("Eliminar")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                                  email: x['email'],
                                                  password: x['password'])
                                              .then((value) => {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Exitoso')
                                                  })
                                              .catchError((e) {
                                            Fluttertoast.showToast(
                                                msg: e!.message);
                                          });
                                        },
                                        child: Text("Aceptar")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ]),
        ));
  }
// post()async{
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;
//   UserModel userModel = UserModel();
//   userModel.email = user!.email;
//   userModel.uid = user.uid;
//   userModel.name = x['name'];
//   userModel.phone = x['phone'];
//   userModel.country = x['country'];
//   userModel.schedule = x['schedule'];
//   userModel.image = x['imageurl'];
//   userModel.resume = x['resume'];
//   userModel.nationalId= x['nationalId'];
//   userModel.psychologist=x['psychologist'];
//
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uid)
//       .set(userModel.toMap());
//   Fluttertoast.showToast(msg: 'Account created Successfully:)');
//
// }
}
