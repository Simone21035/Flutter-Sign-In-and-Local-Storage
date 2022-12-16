import 'package:flutter/material.dart';
import 'package:flutter_proj1/screens/Dashboard.dart';
import 'package:flutter_proj1/screens/LoginScreen.dart';
import 'package:flutter_proj1/screens/Settings.dart';
import 'package:flutter_proj1/screens/SignUp.dart';
import 'package:flutter_proj1/widget/ExtractArgumentsScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routename: (BuildContext context) => Settings(),
  SignUp.routeName: (BuildContext context) => SignUp(),
  ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen()
};
