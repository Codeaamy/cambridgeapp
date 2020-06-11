import 'package:cambridgeapp/views/forgetPassword_screen.dart';
import 'package:cambridgeapp/views/login_screen.dart';
import 'package:cambridgeapp/views/main_screen.dart';
import 'package:cambridgeapp/views/video_list_view.dart';
import 'package:cambridgeapp/views/video_watch_view.dart';
import 'package:cambridgeapp/views/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Cambridge_App());

class Cambridge_App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        initialRoute: WelcomeScreen.welcomeScreenRoute,
        routes: {
          WelcomeScreen.welcomeScreenRoute : (context) => WelcomeScreen(),
          LoginScreen.loginSceenRoute : (context) => LoginScreen(),
          ForgetPassword.forgetPasswordRpute : (context) => ForgetPassword(),
          MainScreen.mainScreenRoute : (context) => MainScreen(),
          VideoListView.videoListViewRoute : (context) => VideoListView(null),
          VideoWatchView.videoWatchViewRoute : (context) => VideoWatchView(null,null,null,null,null),
        },
    );
  }
}