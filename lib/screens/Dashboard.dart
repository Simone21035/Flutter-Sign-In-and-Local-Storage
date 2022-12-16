import 'package:flutter/material.dart';
import 'package:flutter_proj1/screens/Settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static String routeName = "/dashboard";
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.routename);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
