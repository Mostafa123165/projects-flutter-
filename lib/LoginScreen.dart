
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var Formkey = GlobalKey<FormState>();
  bool _obscureText = true;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Form(
            key:Formkey,
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30.0 ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultTextFormField(
                  lapel: 'Email',
                  prefix: Icons.email ,
                  type:TextInputType.emailAddress ,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextFormField(
                  Ispassword: true,
                  prefix: Icons.lock ,
                  lapel:'Password',
                  suffix: Icons.remove_red_eye ,
                  type:TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultbutton(
                  text:'LOGIN',
                  function:() {
                    if (Formkey.currentState!.validate()){}
                  }
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

