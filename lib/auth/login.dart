import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_strange_chat/auth/signup.dart';
import 'package:the_strange_chat/chatting/home.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
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

              //E-mail text field
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
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

              //Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //Login button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FlatButton(
                        color: Color(0xff9a2d37),
                        onPressed: login,
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Color(0xff2e9459)),
                        )
                      ),
                    ),
                    //Sized box
                    SizedBox(width: 30,),
                    //Create new account button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FlatButton(
                        color: Color(0xff9a2d37),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Create new account',
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

  Future<void> login() async{
    final _formState = _formKey.currentState;
    if(_formState.validate()){
      _formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}

