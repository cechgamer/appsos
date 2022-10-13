// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// //
// // class PsychologistBot extends StatefulWidget {
// //   const PsychologistBot({Key? key}) : super(key: key);
// //
// //   @override
// //   _PsychologistBotState createState() => _PsychologistBotState();
// // }
// //
// // class _PsychologistBotState extends State<PsychologistBot> {
// //
// //    ScrollController _scrollController = ScrollController();
// //
// //   // final _auth = FirebaseAuth.instance;
// //   TextEditingController chat = new TextEditingController();
// //   String hi='Hi no';
// //   String hiyes='Hi yes';
// //   String ihave='I have love problems';
// //    String alone='Alone';
// //    String angry='Angry';
// //    String frustrated='Frustrated';
// //    String sad='Sad';
// //    String no='No';
// //    String iget='I get angry very often';
// //    String imangry ='I\'m angry about something that happened recently';
// //    String yes='Yes';
// //    String withM='With my family';
// //    String time ='All the time';
// //
// //    ///////////////////////////////////////////
// //    bool v1=false;
// //    bool v2=false;
// //    bool v3=false;
// //    bool v4=false;
// //    bool v5=false;
// //    bool v6=false;
// //    bool v7=false;
// //    bool v8=false;
// //    bool v9=false;
// //    bool v10=false;
// //    bool v11=false;
// //    bool v12=false;
// //    bool v13=false;
// //    bool v14=false;
// //    bool v15=false;
// //
// // //////////////////////////////////////////////
// //
// // //////////////////////////////////////////////
// //  double s2=100;
// //   ////////////////////////////////////////////
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //         // backgroundColor: Color(0xff5f1090),
// //         body: Column(
// //       // mainAxisAlignment: MainAxisAlignment.t,
// //       children: [
// //         Expanded(
// //           child: Container(
// //             color: Color(0xff261832),
// //             width: double.infinity,
// //             child: SingleChildScrollView(
// //                       // controller: ,
// //               child: Container(
// //                 child: ListView(
// //
// //                     controller: _scrollController,
// //                     // reverse: true,
// //                     shrinkWrap: true,
// //                     physics: NeverScrollableScrollPhysics(),
// //                   children:[ Column(
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 50),
// //                         child: Container( width: 90,height: 40,color: Colors.yellow,
// //                         child: Center(child: Text('Hello,are you okay'))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                           visible:v1 ,
// //                             child: Container(
// //                             width: 90,height: 40,color: Colors.greenAccent,
// //                             child: Center(child: Text('Hi no')))),
// //                       ), Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                           visible:v1 ,
// //                             child: Container(
// //                             width: 130,height: 100,color: Colors.yellow,
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(10.0),
// //                               child: Text('Also do not forget to meditate to'
// //                               'learn to listen to your emotions, to'
// //                                   ' know yourself better, to learn to love'
// //                                   'and love yourself :)'),
// //                             ))),
// //                       ), Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                           visible:v3 ,
// //                             child: Container(
// //                             width: 160,height: s2,color: Colors.yellow,
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(10.0),
// //                               child: Text("It may be easier"
// //                               "for you to start"
// //                                   "by telling me which of the"
// //                                   "following optionsyou most identify with:+ Angry+ Frustrated+ Sad+ Alone+ I have loveproblems"),
// //                             ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v4 ,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('Hi yes')))),
// //
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v4,
// //                             child: Container(
// //                                 width: 160,height: s2,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text("That makes me very happy.Don't forget to drink water,put on sunscreen and sunbathe to be happier."
// //                                       ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v4,
// //                             child: Container(
// //                                 width: 160,height: s2,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text("Also do not forget to meditate to learn to listen to your emotions, tok now yourself better, to learn to love and love yourself :)"
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v5 ,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('I hae love problems')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v5,
// //                             child: Container(
// //                                 width: 160,height: s2,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text('Please, I ask you to call a psychologist anonymously through this app. This is a sensitive issue since in love'
// //                                       'relationships it is easy to go from psychological violence'
// //                                       'to physical violence. I love you very much, take care of'
// //                                       'you'
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v6,
// //                             child: Container(
// //                                 width: 160,height: 70,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text('First of all, I am  '
// //                                       ' so sorry that you'
// //                                      ' feel like this now'
// //                                           ':('
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v6,
// //                             child: Container(
// //                                 width: 160,height: 70,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text('Writing helps us feel better. Trust me,'
// //                                       'this will help bring happiness and'
// //                                       'tranquility back to you. Tell me why'
// //                                       'you feel lonely.'
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //
// //
// //
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v7,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('Angry')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v7,
// //                             child: Container(
// //                                 width: 160,height: 70,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text('The Roman'
// //                                      ' philosopher'
// //                                      ' Seneca once'
// //                                      ' said; Anger is an'
// //                                       'acid that can do more damage to'
// //                                       'the container in'
// //                                       'which it is stored'
// //                                       'than to anything'
// //                                       'on which it is'
// //                                       'poured. So tell me, are you'
// //                                      ' angry about'
// //                                       'something that'
// //                                       'happened'
// //                                       'recently and this'
// //                                       'is not something'
// //                                       'common for you'
// //                                       'or do you get'
// //                                       'angry very'
// //                                       'often?'
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v8,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('Frustrated')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v8,
// //                             child: Container(
// //                                 width: 160,height: 260,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'First of all I want to congratulate you for'
// //                                   'accepting that you feel frustrated. Did'
// //                                     '  you know that Daniel Goleman, creator'
// //                                       'of the concept of emotional intelligence,'
// //                                       'considers that the ability to handle'
// //                                   'frustration is one of the most important'
// //                                   'to achieve success. It is much more'
// //                                   'important than having endless special'
// //                                       'talents!'
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v8,
// //                             child: Container(
// //                                 width: 160,height: 180,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Writing helps us feel better by reducing'
// //                                       'the stress caused by frustration. Trust me, this will help bring happiness and'
// //                                   'tranquility back to you. Tell me why you'
// //                                       'feel frustrated.'
// //                                   ),
// //                                 ))),
// //                       ), Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v9,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('Sad')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v9,
// //                             child: Container(
// //                                 width: 160,height: 170,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'First of all, I am very sorry that you feel'
// //                                       'like this now: ('
// //                                   'Sadness is a normal emotion and, as'
// //                                       'such, it is part of life. Even I feel sad'
// //                                       'sometimes, do you feel sad very often?'
// //
// //                                   ),
// //                                 ))),
// //                       ),Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v10,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('No')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v10,
// //                             child: Container(
// //                                 width: 160,height: 260,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Focus on the'
// //                                       'cause of'
// //                                       'sadness and not'
// //                                       'sadness, seek'
// //                                       'support from'
// //                                       'your loved ones,'
// //                                       'do sports or whatever puts'
// //                                   'you in a good mood. Don\'t'
// //                                   'forget to avoid'
// //                                   'apathy. There'
// //                                   'are people who'
// //                                   'love you very much, seeking'
// //                                   'help is not'
// //                                       'synonymous with weakness :)'
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v11,
// //                             child: Container(
// //                                 width: 90,height: 40,color: Colors.greenAccent,
// //                                 child: Center(child: Text('Yes')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v11,
// //                             child: Container(
// //                                 width: 160,height: 140,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Writing helps us feel better. Trust me,'
// //                                       ' this will help bring happiness and '
// //                                   ' tranquility back to you.  Tell me why'
// //                                   ' you feel sad.'
// //
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v12,
// //                             child: Container(
// //                                 width: 90,height: 80,color: Colors.greenAccent,
// //                                 child: Center(child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text('I\'m angry about something'
// //                                      ' that happened recently'),
// //                                 )))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v12,
// //                             child: Container(
// //                                 width: 160,height: 150,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Writing helps us'
// //                                       'feel better by'
// //                                   'reducing the'
// //                                   'stress of anger.'
// //                                   'Trust me, this'
// //                                       'will help bring'
// //                                   'happiness and'
// //                                   'tranquility back'
// //                                   'to you. Tell me'
// //                                       ' why you feel'
// //                                       'angry'
// //
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v13,
// //                             child: Container(
// //                                 width: 90,height: 60,color: Colors.greenAccent,
// //                                 child: Center(child: Text('I get angry very often')))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v13,
// //                             child: Container(
// //                                 width: 160,height: 270,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Anger is a'
// //                                       'normal human'
// //                                   'emotion but'
// //                                   'when you get'
// //                                   'angry it often'
// //                                   'becomes a'
// //                                   'problem that'
// //                                   'hurts you a lot. It'
// //                                   'is a great'
// //                                   'progress that'
// //                                   'you recognize'
// //                                   'that your anger'
// //                                   'occurs next,'
// //                                       'remember that'
// //                                       'acceptance is'
// //                                       'the first step to'
// //                                       'solve the'
// //                                       'problems that'
// //                                       'overwhelm us.'
// //
// //
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v13,
// //                             child: Container(
// //                                 width: 160,height: 220,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Getting angry'
// //                                       'often is usually'
// //                                       'accompanied by'
// //                                       'discord with'
// //                                       'co-workers,'
// //                                       'places where'
// //                                       'you are no'
// //                                       'longer welcome,'
// //                                       'relatives who'
// //                                       'distance'
// //                                       'themselves from'
// //                                       'you. And it is'
// //                                       'very likely that'
// //                                   'you hold a'
// //                                   'grudge or plan to'
// //                                   'get revenge.'
// //
// //
// //
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v13,
// //                             child: Container(
// //                                 width: 160,height: 120,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Are your anger'
// //                                       'problems'
// //                                       'present in'
// //                                       'everything, in'
// //                                       'your family or'
// //                                       ' only with your'
// //                                       'partner?'
// //
// //
// //
// //
// //
// //
// //                                   ),
// //                                 ))),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v14,
// //                             child: Container(
// //                                 width: 90,height: 60,color: Colors.greenAccent,
// //                                 child: Center(child: Text('With my family')))),
// //                       ),
// //
// //
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v13,
// //                             child: Container(
// //                                 width: 160,height: 50,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Try family'
// //                                       'therapy or:'),))),),
// //
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 90,height: 60,color: Colors.greenAccent,
// //                                 child: Center(child: Text('All the time')))),
// //
// //                       ),
// //
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 220,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Try to calm your'
// //                                     'anger: Mentally'
// //                                     'repeat positive'
// //                                     'phrases like'
// //                                     'keep calm", I\'m'
// //                                     'angry, but I can manage not to'
// //                                   'get too upset." In'
// //                                     'this way, you will'
// //                                     'avoid reaching a'
// //                                     'high level of'
// //                                     ' activation and'
// //                                     'you will be able'
// //                                   'to converse in a more relaxed'
// //                                   'way'),))),), Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 120,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Do physical'
// //                                       'exercise: With'
// //                                   'this we release'
// //                                   'those contained'
// //                                   'emotions such'
// //                                   'as anger or'
// //                                       ' frustration'
// //                                   ' way'),))),),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 200,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                       'Communicate: It is very important that both of you express how you feel about what has happened, or what bothers you, without this implying an attack on the other. That is, in an assertive way'
// //                                   'way'),))),)
// //                       ,
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 220,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                   'Work on empathy: Increase the ability to put yourself in the place of the other person to understand how they may be feeling. This can facilitate that, in future occasions, high levels of anger are reached.'),))),),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 120,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                   'Practice relaxation techniques: It will help reduce activation due to anger, rage, etc.'),))),),
// //                       Padding(
// //                         padding: const EdgeInsets.only(right: 190, top: 40),
// //                         child: Visibility(
// //                             visible:v15,
// //                             child: Container(
// //                                 width: 160,height: 120,color: Colors.yellow,
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(10.0),
// //                                   child: Text(
// //                                   'If the above did not help, I recommend you anonymously call a psychologist from this app or go to your trusted psychologist..'),))),),
// //                     ],
// //                   ),
// //                 ]),
// //               ),
// //             ),
// //           ),
// //         ),
// //         Container(
// //           color: Colors.white,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 child: Container(
// //                   height: 40,
// //                   child: TextFormField(
// //                     textCapitalization: TextCapitalization.sentences,
// //                     controller: chat,
// //                     textAlign: TextAlign.left,
// //                     keyboardType: TextInputType.text,
// //                     decoration: InputDecoration(
// //                       filled: true,
// //                       fillColor: Colors.white,
// //                       hintText: 'Type.....',
// //                     ),
// //                   ),
// //                   alignment: Alignment.bottomCenter,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 5,
// //               ),
// //               IconButton(
// //                   onPressed: () {
// //
// //
// //                     if (hi.contains(chat.text)) {
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                       setState(() {
// //                                     v1=true;
// //                                     v3=true;
// //
// //                       });
// //                     }
// //                     else if(hiyes.contains(chat.text)) {
// //                                       chat.clear();
// //                                       setState(() {
// //                         v4=true;
// //                       });
// //
// //                     }
// //                else if(ihave.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v5=true;
// //                            });
// //                     }  else if(alone.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v6=true;
// //                            });
// //                     } else if(angry.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v7=true;
// //                            });
// //                     }else if(frustrated.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v8=true;
// //                            });
// //                     }else if(sad.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v9=true;
// //                            });
// //                     }else if(no.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v10=true;
// //                            });
// //
// //                   }
// //                     else if(yes.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v11=true;
// //                            });
// //                     } else if(imangry.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v12=true;
// //                            });
// //                     }else if(iget.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v13=true;
// //                            });
// //                     }else if(withM.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v14=true;
// //                            });
// //                     }else if(time.contains(chat.text)){
// //                       chat.clear();
// //                       _scrollController.animateTo(
// //                           _scrollController.position.maxScrollExtent,
// //                           duration: Duration(milliseconds: 200),
// //                           curve: Curves.easeOut
// //                       );
// //                            setState(() {
// //
// //                              v15=true;
// //                            });
// //                     }
// //                   },
// //                   icon: Icon(Icons.send)),
// //               SizedBox(
// //                 width: 5,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     ));
// //   }
// // }
// //
// //
// // //
// // // import 'package:bubble/bubble.dart';
// // // import 'package:dialogflow_flutter/googleAuth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:dialogflow_flutter/dialogflowFlutter.dart';
// //
// //
// //
// // // class Psychologistbot extends StatefulWidget {
// // //   @override
// // //   _PsychologistbotState createState() => _PsychologistbotState();
// // // }
// // //
// // // class _PsychologistbotState extends State<Psychologistbot> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primaryColor: Colors.blue,
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: ChatBotScreen(),
// // //     );
// // //   }
// // // }
// // //
// // // class ChatBotScreen extends StatefulWidget {
// // //   @override
// // //   _ChatBotScreenState createState() => _ChatBotScreenState();
// // // }
// // //
// // // class _ChatBotScreenState extends State<ChatBotScreen> {
// // //   final messageInsert = TextEditingController();
// // //   List<Map> messsages = [];
// // //   void response(query) async {
// // //     AuthGoogle authGoogle =
// // //     await AuthGoogle(fileJson: "assets/farmtech-fh9j-3db6e0409c71.json")
// // //         .build();
// // //     DialogFlow dialogflow = DialogFlow(authGoogle: authGoogle, language: "en");
// // //     AIResponse aiResponse = await dialogflow.detectIntent(query);
// // //     setState(() {
// // //       messsages.insert(0, {
// // //         "data": 0,
// // //         "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
// // //       });
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         centerTitle: true,
// // //         toolbarHeight: 70,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.only(
// // //             bottomLeft: Radius.circular(30),
// // //             bottomRight: Radius.circular(30),
// // //           ),
// // //         ),
// // //         elevation: 10,
// // //         title: Text("Dailog Flow Chatbot"),
// // //       ),
// // //       body: Container(
// // //         child: Column(
// // //           children: <Widget>[
// // //             Flexible(
// // //                 child: ListView.builder(
// // //                     reverse: true,
// // //                     itemCount: messsages.length,
// // //                     itemBuilder: (context, index) => chat(
// // //                         messsages[index]["message"].toString(),
// // //                         messsages[index]["data"]))),
// // //             Divider(
// // //               height: 6.0,
// // //             ),
// // //             Container(
// // //               padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
// // //               margin: const EdgeInsets.symmetric(horizontal: 8.0),
// // //               child: Row(
// // //                 children: <Widget>[
// // //                   Flexible(
// // //                       child: TextField(
// // //                         controller: messageInsert,
// // //                         decoration: InputDecoration.collapsed(
// // //                             hintText: "Send your message",
// // //                             hintStyle: TextStyle(
// // //                                 fontWeight: FontWeight.bold, fontSize: 18.0)),
// // //                       )),
// // //                   Container(
// // //                     margin: EdgeInsets.symmetric(horizontal: 4.0),
// // //                     child: IconButton(
// // //                         icon: Icon(
// // //                           Icons.send,
// // //                           size: 30.0,
// // //                         ),
// // //                         onPressed: () {
// // //                           if (messageInsert.text.isEmpty) {
// // //                             print("empty message");
// // //                           } else {
// // //                             setState(() {
// // //                               messsages.insert(0,
// // //                                   {"data": 1, "message": messageInsert.text});
// // //                             });
// // //                             response(messageInsert.text);
// // //                             messageInsert.clear();
// // //                           }
// // //                         }),
// // //                   )
// // //                 ],
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               height: 15.0,
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget chat(String message, int data) {
// // //     return Padding(
// // //       padding: EdgeInsets.all(10.0),
// // //       child: Bubble(
// // //           radius: Radius.circular(15.0),
// // //           color: data == 0 ? Colors.blue : Colors.orangeAccent,
// // //           elevation: 0.0,
// // //           alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
// // //           nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
// // //           child: Padding(
// // //             padding: EdgeInsets.all(2.0),
// // //             child: Row(
// // //               mainAxisSize: MainAxisSize.min,
// // //               children: <Widget>[
// // //                 CircleAvatar(
// // //                   backgroundImage: AssetImage(
// // //                       data == 0 ? "assets/bot.png" : "assets/user.png"),
// // //                 ),
// // //                 SizedBox(
// // //                   width: 10.0,
// // //                 ),
// // //                 Flexible(
// // //                     child: Text(
// // //                       message,
// // //                       style: TextStyle(
// // //                           color: Colors.white, fontWeight: FontWeight.bold),
// // //                     ))
// // //               ],
// // //             ),
// // //           )),
// // //     );
// // //   }
// // // }
//
//
//
// import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:flutter/material.dart';
//
// import 'ChatBody.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late DialogFlowtter dialogFlowtter;
//   final TextEditingController _controller = TextEditingController();
//
//   List<Map<String, dynamic>> messages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title ?? 'DialogFlowtter app'),
//       ),
//       body: Column(
//         children: [
//           Expanded(child: AppBody(messages: messages)),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 5,
//             ),
//             color: Colors.blue,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 IconButton(
//                   color: Colors.white,
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     sendMessage(_controller.text);
//                     _controller.clear();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void sendMessage(String text) async {
//     if (text.isEmpty) return;
//     setState(() {
//       addMessage(
//         Message(text: DialogText(text: [text])),
//         true,
//       );
//     });
//
//     dialogFlowtter.projectId = "deimos-apps-0905";
//
//     DetectIntentResponse response = await dialogFlowtter.detectIntent(
//       queryInput: QueryInput(text: TextInput(text: text)),
//     );
//
//     if (response.message == null) return;
//     setState(() {
//       addMessage(response.message!);
//     });
//   }
//
//   void addMessage(Message message, [bool isUserMessage = false]) {
//     messages.add({
//       'message': message,
//       'isUserMessage': isUserMessage,
//     });
//   }
//
//   @override
//   void dispose() {
//     dialogFlowtter.dispose();
//     super.dispose();
//   }
// }