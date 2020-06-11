import 'package:cambridgeapp/components/AllButton.dart';
import 'package:cambridgeapp/components/constant.dart';
import 'package:cambridgeapp/views/forgetPassword_screen.dart';
import 'package:cambridgeapp/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';




class LoginScreen extends StatefulWidget {
  static String loginSceenRoute = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false ;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox (
                  height: 75.0,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('images/cm_logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFiledFieldDecoration.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFiledFieldDecoration.copyWith(hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                customRoundButton(
                  title: "Log In",
                  color: Colors.redAccent,
                  width: width * 0.8,
                  height: height * 0.1,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    print("Loggin Button Pressed");
                   if(email != "" && password != "" || password == null){
                     try {
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password).catchError((error){
                        setState(() {
                          showSpinner = false;
                        });
                      Alert(context: context,
                          type: AlertType.error,
                          title: 'Error',
                          desc: '$error').show();

                      return;
                    });
                    if(user != null){
                      //Take to feed screen
                      Navigator.pushReplacementNamed(context, MainScreen.mainScreenRoute);
//                      Firestore.instance.collection('Users').document(role).collection(user.user.uid).add({
//                        'email': "${email}",
//                        'password' : "${password}",
//                        'uid' : "${user.user.uid}"
//                      });
                    }
                    setState(() {
                      showSpinner = false;
                    });
                   }catch (e) {
                       print(e);
                     }
                   }else{
                     setState(() {
                       showSpinner = false;
                     });
                   }
                  },
                ),
                normalButton(
                  title: "Forgot Password ?",
                  color: Colors.grey,
                  onPressed: (){
                    print("On pressed Button Pressed");
                    Navigator.pushNamed(context, ForgetPassword.forgetPasswordRpute);
                  },
                )
             ]
            ),
          ),
        ),
      ),
    );
  }
}
