import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj1/models/StorageItem.dart';
import 'package:flutter_proj1/screens/Dashboard.dart';
import 'package:flutter_proj1/screens/SignUp.dart';
import 'package:flutter_proj1/services/AuthService.dart';
import 'package:flutter_proj1/services/StorageService.dart';
import 'package:flutter_proj1/widget/CustomTextField.dart';
import 'package:flutter_proj1/widget/PasswordField.dart';
import 'package:flutter_proj1/widget/PrimaryButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StorageService _storageService = StorageService();
  AuthService _authservice = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLogginIn = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: ModalProgressHUD(
            inAsyncCall: isLogginIn,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: width * .9,
                  child: Column(
                    children: [
                      CustomTextField(
                          labelText: "Email Address",
                          hintText: "Enter your email address",
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PasswordField(
                          obscureText: obscurePassword,
                          onTap: handleObscurePassword,
                          labelText: "Password",
                          hintText: "Enter your password",
                          controller: _passwordController),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PrimaryButton(
                        text: "Login",
                        iconData: Icons.login,
                        onPress: () {
                          loginWithEmail();
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PrimaryButton(
                        text: "Sign up",
                        iconData: Icons.app_registration,
                        onPress: () {
                          Navigator.pushReplacementNamed(
                              context, SignUp.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  // loginWithProvider() async {
  //   try {
  //     setState(() {
  //       isLogginIn = true;
  //     });
  //     var user = await _authservice.signInWithGoogle();
  //     var accessToken =
  //         StorageItem("accessToken", user.credential?.accessToken as String);
  //     await _storageService.savedData(accessToken);
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushReplacementNamed(context, Dashboard.routeName);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   setState(() {
  //     isLogginIn = false;
  //   });
  // }

  loginWithEmail() async {
    try {
      setState(() {
        isLogginIn = true;
      });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.toString(),
          password: _passwordController.toString());
      var accessToken = StorageItem(
          "accessToken", credential.user.email?.accessToken as String);
      await _storageService.savedData(accessToken);
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    setState(() {
      isLogginIn = false;
    });
  }
}
