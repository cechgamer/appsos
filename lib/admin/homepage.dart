import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PsychologistReports extends StatefulWidget {
  const PsychologistReports({Key? key}) : super(key: key);

  @override
  _PsychologistReportsState createState() => _PsychologistReportsState();
}

class _PsychologistReportsState extends State<PsychologistReports> {
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
                            SizedBox(width:260,),

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
                      SingleChildScrollView(
                          child: SizedBox(
                              height: 400,
                              child: TabBarView(children: [
                                Center(
//////////////////////////////////////////First Page///////////////////// ///////////////////////////////////////////////////

                                    child: SingleChildScrollView(
                                      child: Container(
                                          color: Colors.white,
                                          child: Column(children: [
                                            SingleChildScrollView(
                                              child: Column(children: [
                                            SingleChildScrollView(
                                            child: Column(children:[

                                  Column(children: [
                                    SingleChildScrollView(
                                      child: Column(children: [
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("CitiReports")
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
                                                            top: 30.0, right: 10, ),
                                                        child: Card(
                                                          child: Column(children: [
                                                            SizedBox(height: 10,),

                                                            CircleAvatar(backgroundImage:NetworkImage(x['ImageUrl']) ,radius: 40,),
                                                            SizedBox(height: 10,),
                                                            Text("Name :${x['name']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                            SizedBox(height: 5,),

                                                            Center(child: Text("Email:   ${x['email']}")),
                                                            SizedBox(height: 5,),
                                                            Text("Phone: ${x['phone']}"),
                                                            SizedBox(height: 5,),
                                                            Text('Country: ${x['country']}'),
                                                            SizedBox(height: 5,),
                                                            Text('National ID: ${x['nationalId']}'),
                                                             SizedBox(height: 20,),
                                                            Text('Report Reason${x['reports']}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                                                            SizedBox(height: 30,),



                                                          ],),
                                                        )
                                                    );
                                                  });
                                            }),

                                      ]),
                                    ),

                                  ],)
                                  ]),

                                            )]),
                                            )
                                          ])),
                                    )),
                                SingleChildScrollView(
                                  child: Container(
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                        SingleChildScrollView(
                                        child: Column(children:[
                                          SizedBox(height: 10,),
                                          SizedBox(height: 30,),
                                          SizedBox(height: 30,child: Text("Psychologist Reports",style: TextStyle(color: Colors.white),),),
                                          Column(children: [
                                            SingleChildScrollView(
                                              child: Column(children: [
                                                StreamBuilder(
                                                    stream: FirebaseFirestore.instance
                                                        .collection("SychoReports")
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
                                                                  child: Column(children: [
                                                                    SizedBox(height: 10,),

                                                                    CircleAvatar(backgroundImage:NetworkImage(x['imageurl']) ,radius: 40,),
                                                                    SizedBox(height: 10,),
                                                                    Text("Name :${x['name']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                                    SizedBox(height: 5,),

                                                                    Center(child: Text("Email:   ${x['email']}")),
                                                                    SizedBox(height: 5,),

                                                                    Text("Contacto: ${x['phone']}"),
                                                                    SizedBox(height: 5,),
                                                                    Text('País: ${x['country']}'),
                                                                    SizedBox(height: 5,),
                                                                    Text('Documento de Identidad: ${x['nationalId']}'),
                                                                    Text("Horario: ${x['schedule']}"),
                                                                    SizedBox(height: 5,),
                                                                     Text('Razón de reporte: ${x['reports']}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                                                                    SizedBox(height: 30,),


                                                                  ],),
                                                                )
                                                            );
                                                          });
                                                    }),

                                              ]),
                                            ),
                                            SizedBox(height: 30,),
                                          ],)
                                          ]),
                                  )
                                        ]),
                                      )),
                                )
                              ])))
                    ])))));
  }
}

