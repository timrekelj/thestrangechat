import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_strange_chat/auth/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password, _confirmedPassword, _username;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext thisContext) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff202020)),
        child: Form(
          key: _formKey,
          child: ListView(
           children: <Widget>[

              //Logo image
              Padding(
                padding: const EdgeInsets.fromLTRB(30,30,30,30),
                child: Image.asset(
                'assets/images/ChatLogo.png',
                fit: BoxFit.fitWidth,
                ),
              ),

              //Username text field
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff2e9459)),
                  validator: (input) {
                    if (input.length < 8) {
                      return 'Your username is too short';
                    }
                  },
                  onSaved: (input) => _username = input,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Color(0xff2e9459)),
                    icon: Icon(Icons.person, color: Color(0xff2e9459),),
                  ),
                ),
              ),

              //E-mail text field
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff2e9459)),
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Please type an email';
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xff2e9459)),
                    icon: Icon(Icons.email, color: Color(0xff2e9459),),
                  ),
                ),
              ),

              //Password text field
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff2e9459)),
                  validator: (input) {
                    if(input.length < 6){
                      return 'Your password is too short';
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    labelText: 'Password',
                    labelStyle:TextStyle(color: Color(0xff2e9459)),
                    icon: Icon(Icons.lock, color: Color(0xff2e9459))
                  ),
                  obscureText: true,
                ),
              ),

              //Confirmed password text field
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff2e9459)),
                  validator: (input) {
                    if (input != _password) {
                      return 'Paswords do not match';
                    }
                  },
                  onSaved: (input) => _confirmedPassword = input,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff2e9459),
                        width: 2
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Color(0xff9a2d37),
                        width: 2
                      )
                    ),
                    labelText: 'Confirm Password',
                    labelStyle:TextStyle(color: Color(0xff2e9459)),
                    icon: Icon(Icons.lock_open, color: Color(0xff2e9459))
                  ),
                  obscureText: true,
                ),
              ),

              //Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Login button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FlatButton(
                        color: Color(0xff9a2d37),
                        onPressed: signup,
                        child: Text(
                          'Create account',
                          style: TextStyle(color: Color(0xff2e9459)),
                        )
                      ),
                    ),
                    //Create new account button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FlatButton(
                        color: Color(0xff9a2d37),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: Text(
                          'Log in to existing account',
                          style: TextStyle(color: Color(0xff2e9459)),
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Future<void> signup() async{
    final _formState = _formKey.currentState;
    if(_formState.validate()){
      _formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser userEmail = user.user;
        userEmail.sendEmailVerification();
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
      }catch(e){
        print(e.message);
      }
    }
  }
}