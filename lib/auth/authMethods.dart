import 'package:flutter/material.dart';

class AuthMethods {
  void emailSent(BuildContext context) {
    showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Verification email has been sent'),
          actions: <Widget>[
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
}