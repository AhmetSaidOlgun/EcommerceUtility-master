import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utilityapp/pages/Home.dart';
import 'package:utilityapp/pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utilityapp/pages/reset.dart';
import 'package:utilityapp/pages/verifying.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email, _password;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        flexibleSpace: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('UtilityImages/iconofutılıty.png'),
    fit: BoxFit.contain
    )
    ),
    ),
    title: InkWell(
    child: Text('Utility Appearel', style: TextStyle(color: Colors.white) )),
    ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: TextFormField(
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: TextFormField(
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(Icons.lock_open_sharp  ),
                border: OutlineInputBorder(),
              ),
              onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,15,0,8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Sign İn"),
                    onPressed: () => _signin(_email, _password    )),
                ElevatedButton(
                    child: Text("Sign Up"),
                    onPressed: () => _signup(_email, _password ))
              ],
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(child: Text('Forgot Password?'), onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetScreen())))
            ],
          )
        ],
      ),

    );
  }
  _signin(String _email, String _password) async{
    try{
    await auth.signInWithEmailAndPassword(email: _email, password: _password);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  } on FirebaseAuthException catch (error){
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
  _signup(String _email, String _password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (error){
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
