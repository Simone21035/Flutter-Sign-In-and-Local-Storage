import 'package:flutter/material.dart';
import 'package:flutter_proj1/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_proj1/screens/LoginScreen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: LoginScreen.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}
