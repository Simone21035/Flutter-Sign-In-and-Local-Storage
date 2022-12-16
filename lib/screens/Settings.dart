import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj1/screens/LoginScreen.dart';
import 'package:flutter_proj1/services/AuthService.dart';
import 'package:flutter_proj1/services/StorageService.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static String routename = "/settings";
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  StorageService _storageService = StorageService();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await _authService.logout();
              _storageService.deleteAllData();
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (Route<dynamic> route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
