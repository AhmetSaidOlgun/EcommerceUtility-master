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
import 'package:utilityapp/pages/verifying.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
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
    child: Text('Reset Password', style: TextStyle(color: Colors.white) )),
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
            padding: const EdgeInsets.fromLTRB(30,15,0,8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Send Request"),
                    onPressed: (){
                      auth.sendPasswordResetEmail(email: _email);
                      Navigator.of(context).pop();
                }),
              ],
            ),
          ),
        ],
      ),

    );
  }


}
