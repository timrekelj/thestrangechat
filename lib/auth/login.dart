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
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff2e9459)),
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Please type an email';
                    }
                    return null;
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
                    return null;
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

              SizedBox(height: 10),

              //Forgot your password? text
              Center(
                child: GestureDetector(
                  onTap: () {
                    _resetPassword();
                  },
                  child: Text(
                    'Forgot your password? Tap here!',
                    style: TextStyle(
                      color: Color(0xff2e9459)
                    )
                  ),
                ),
              ),

              //Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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

  //login method
  Future<void> login() async{
    final _formState = _formKey.currentState;
    if(_formState.validate()){
      _formState.save();
      AuthResult user;
      try{
        //try to sign in
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser userEmail = user.user;
        //if email is verified, the user can continue to the menu
        if (userEmail.isEmailVerified) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
        }
        //if email is not verified, the user CANNOT continue
        else{
          _unverifiedEmail(userEmail);
        }
      }catch(e){
        if(user == null) {
          _wrongCredentials();
        }
        //if the error is not 'user not found', write the error to the console
        else {
          print(e.hashCode.toString() + '   ||||||||   ' + e.toString());
        }
      }
    }
  }

  //TODO nicer UI for wrong credentials alert
  //Alert for wrong entered credentials
  void _wrongCredentials(){
    showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wrong email or password'),
        );
      }
    );
  }

  //TODO UI design for alert
  //Alert for unverified email
  void _unverifiedEmail(FirebaseUser userEmail) {
    showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Unverified email'),
          actions: <Widget>[
            //Button for verification
            FlatButton(
              child: Text('Send verification email'),
              onPressed: () {
                userEmail.sendEmailVerification();
                Navigator.of(context).pop();
              },
            ),
            //Close window button
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  //Alert for reseting password
  void _resetPassword() {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    String _emailForReset;
    showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset your password'),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xff2e9459)),
              validator: (input) {
                if(input.isEmpty){
                  return 'Please type an email';
                }
                return null;
              },
              onSaved: (input) => _emailForReset = input,
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
          actions: <Widget>[
            FlatButton(
              child: Text('Reset my password'),
              onPressed: () async {
                //Method for reseting the password
                await _firebaseAuth.sendPasswordResetEmail(email: _emailForReset);
                //TODO alert for sent email
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}
