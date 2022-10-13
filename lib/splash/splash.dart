import 'dart:async';
import 'dart:ui';
import 'package:carwash/signup/signin.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppSos',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  // final storage=new FlutterSecureStorage();
  // Future <bool> logInCheck ()async{
  //   String?value=await storage.read(key: 'uid');
  //   if(value==null){
  //     return false;
  //   }
  //   return true;
  //
  // }
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // final introData = GetStorage();

  @override
  void initState() {
    //TODO:implement.initState
    super.initState();
    // introData.writeIfNull('displayed', false);
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignIn()
      // introData.read('displayed')
      //     ? Home()
          // : MyHomePage()



      )
      );
    });
  }

  // @override
  // void initState() {
  //
  //   super.initState();
  //   Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder:
  //               (context) =>
  //               MyHomePage()
  //           )
  //       )
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0xFFE5E7DE),
                Color(0xFF5602D0),
              ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/splashs.png",
                  height: 300.0,
                  width: 300.0,
                ),
                Text("APPSOS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}