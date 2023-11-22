import 'dart:ui';

import 'package:audio_player/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: FloatingActionButton(
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return LoginPage();
            }));
          },
          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}