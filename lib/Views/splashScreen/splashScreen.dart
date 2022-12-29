import 'dart:async';

import 'package:barley_and_roof/Controllers/Login/LoginController.dart';
import 'package:barley_and_roof/Models/UserModel/UserModel.dart';
import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/AllProperties.dart';
import 'package:barley_and_roof/Views/Home/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UserViews/Login/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserModel userModel = UserModel();

  Future<UserModel> getUserData() async {
    String? email = await FirebaseAuth.instance.currentUser?.email;
    var res = await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(email)
        .get();
    userModel = UserModel.fromJson(res.data()!);

    return userModel;
  }

  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FutureBuilder(
                      future: getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HomePage(
                            userName: userModel.name!,
                            email: userModel.email!,
                          );
                        } else {
                          return const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Login();
                }
              },
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/BackgroundImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 190,
            width: 190,
            child: Image.asset(
              "assets/Images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
