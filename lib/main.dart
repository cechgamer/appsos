
import 'package:carwash/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}
//APiKey//////////////////
//AIzaSyCMuJPdg1n9xZNQYuhskJPrWnRs5syu-_s