import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce2/view/screens/welcomepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ecommerce2/view/screens/view_auth/loginscreen.dart';
import 'package:ecommerce2/view/screens/view_auth/registerscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash:Center(
          child:Container(
              height:double.infinity ,
              width:double.infinity ,
              child: Image.asset('assets/images/Content.jpg',fit:BoxFit.cover,)),

        ),
        nextScreen:const WelcomePage(),
        splashIconSize:double.infinity ,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        duration:2000,
      ),
    );
  }
}

