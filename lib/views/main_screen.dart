import 'package:cambridgeapp/components/AllButton.dart';
import 'package:cambridgeapp/views/video_list_view.dart';
import 'package:cambridgeapp/views/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MainScreen extends StatefulWidget {
  static String mainScreenRoute = 'main_screen';


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
        message: 'Please Wait',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambridge Little Ones'),
        elevation: 3,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              if(FirebaseAuth.instance.currentUser() == null){
                Navigator.pushNamed(context, WelcomeScreen.welcomeScreenRoute);
              }else {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, WelcomeScreen.welcomeScreenRoute);

              }
            },
            child: Text("Sign Out"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mark Attendance to Watch lecture', style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold ,color: Colors.deepPurple
              ),
              ),
              customRoundButton(
                title: 'Mark Attendance',
                color: Colors.green,
                textColor: Colors.white,
                width: width * 0.8,
                height: height * 0.5,
                onPressed: () async {
                  var user = await FirebaseAuth.instance.currentUser();
                  if(user == null) {
                    Navigator.pushReplacementNamed(context, WelcomeScreen.welcomeScreenRoute);
                  }else{
                    print('Attendance button');
                    pr.show();
                    var email = user.email.substring(0, user.email.length - 8).toLowerCase();
                    var uid = user.uid;
                    print(email+" "+ uid);

                    var collectionName = email + uid ;
                    var date = DateTime.now().toString();

                    Firestore.instance.collection('admission').document('students').collection(collectionName).document(collectionName).updateData({"attendance": FieldValue.arrayUnion([date])}).whenComplete((){
                      pr.hide();
                      Firestore.instance.collection('admission').document('students').collection(collectionName).document(collectionName).get().then((value){

                        var className = value.data['standard'];
                        print(className);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoListView(className)));
                      });
                    });
                  }
                },

              ),


            ],
          ),
        ),
      ),
    );
  }
}
