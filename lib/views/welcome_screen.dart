import 'package:cambridgeapp/components/AllButton.dart';
import 'package:cambridgeapp/views/login_screen.dart';
import 'package:cambridgeapp/views/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class WelcomeScreen extends StatefulWidget {

  static String welcomeScreenRoute = 'welcome_screen';
  @override
 _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller ;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.currentUser().then((value){
      if(value != null){
        Navigator.pushReplacementNamed(context, MainScreen.mainScreenRoute);
      }else{

      }
    });
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      controller.value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/cm_logo.png'),
                    height: animation.value * 200,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            customRoundButton(
              title: "Log in",
              color: Colors.redAccent,
              width: width,
              height: width * 0.1,
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.loginSceenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }

}

