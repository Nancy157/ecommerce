import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/view/screens/view_auth/loginscreen.dart';
import 'package:ecommerce2/view/screens/view_auth/registerscreen.dart';
import 'package:ecommerce2/view/widgets/custombutton.dart';
import 'package:ecommerce2/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20,right:20,),
        child: Center(
          child:SingleChildScrollView(
            child: Column(
             // mainAxisAlignment:MainAxisAlignment.center,
              children: [
                CustomText(
                  text:"Welcome To MYShop",
                  fontsize:30,
                  fontweight:FontWeight.bold,
                  alignment:Alignment.center,
                ),
                  SizedBox(
                  height:size.height*0.05,
                ),
                SvgPicture.asset("assets/images/chat.svg",height:size.height*0.45,fit:BoxFit.cover,),
                 SizedBox(
                  height:size.height*0.05
                ),
                CustomButton(
                  text: "LOGIN",
                  onpressed:(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginScreen();
                      }),
                    );
                  },
                ),
                CustomButton(
                  text: "SIGN UP",
                  onpressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return  RegisterScreen();
                      }),
                    );

                  },

                ),
                SizedBox(
                  height:size.height*0.01,
                ),
               Row(

                 children:[
                  CustomText(
                    text:'Already have an account?',
                    fontsize:14,
                    alignment:Alignment.center,
                  ),
                   TextButton(
                       onPressed:(){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (BuildContext context) {
                               return RegisterScreen();
                             }));
                       },
                       child:CustomText(
                         text:'Register Now',
                         color:primaryColorLight,
                         fontsize:16,

                       ),)
                 ],
               ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
