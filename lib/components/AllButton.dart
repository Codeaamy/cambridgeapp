import 'package:flutter/material.dart';


class roundedButton extends StatelessWidget {

  roundedButton({this.title, this.color, @required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Hero(
        tag: 'login_button',
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class normalButton extends StatelessWidget {
  normalButton ({this.title, this.color, @required this.onPressed});

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton (
      child: Text (
        title,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
          color: color,
        ),
      ),
      onPressed: onPressed,
    );
  }
}


class customRoundButton extends StatelessWidget {

  customRoundButton({this.title, this.textColor,this.color, this.height, this.width, @required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;
  final double width;
  final double height;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}


//<!-- The core Firebase JS SDK is always required and must be listed first -->
//<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-app.js"></script>
//
//<!-- TODO: Add SDKs for Firebase products that you want to use
//https://firebase.google.com/docs/web/setup#available-libraries -->
//<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-analytics.js"></script>
//
//<script>
//// Your web app's Firebase configuration
//var firebaseConfig = {
//  apiKey: "AIzaSyBZ0ggtb7OiEM1ysl1Lt1QOohwfwCReVa4",
//  authDomain: "flutterschool-bc934.firebaseapp.com",
//  databaseURL: "https://flutterschool-bc934.firebaseio.com",
//  projectId: "flutterschool-bc934",
//  storageBucket: "flutterschool-bc934.appspot.com",
//  messagingSenderId: "406974704492",
//  appId: "1:406974704492:web:a493338b18f901ed026149",
//  measurementId: "G-ZZ2HJWNENS"
//};
//// Initialize Firebase
//firebase.initializeApp(firebaseConfig);
//firebase.analytics();
//</script>