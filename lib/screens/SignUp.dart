import 'package:flutter/material.dart';
import 'package:flutter_proj1/screens/LoginScreen.dart';
import 'package:flutter_proj1/widget/CustomTextField.dart';
import 'package:flutter_proj1/widget/PasswordField.dart';
import 'package:flutter_proj1/widget/PrimaryButton.dart';
import 'package:flutter_proj1/screens/Dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String routeName = "/signup";
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "First Name",
                        hintText: "Enter your First Name",
                        controller: firstnameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Last Name",
                        hintText: "Enter your Last Name",
                        controller: lastnameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter your email address",
                        controller: emailController,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Confirm Password",
                        hintText: "Enter to confirm password",
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Sign up",
                      iconData: Icons.app_registration,
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (Route<dynamic> route) => false);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ],
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
}
