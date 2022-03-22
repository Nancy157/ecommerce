import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/controller/auth_viewmodel.dart';
import 'package:ecommerce2/view/screens/view_auth/forpasswod.dart';
import 'package:ecommerce2/view/screens/view_auth/registerscreen.dart';
import 'package:ecommerce2/view/widgets/custombutton.dart';
import 'package:ecommerce2/view/widgets/custombutton_social.dart';
import 'package:ecommerce2/view/widgets/customtext.dart';
import 'package:ecommerce2/view/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassWord=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child:FutureBuilder(
                future:fetchlogin(emailcontroller.text,passwordcontroller.text,context),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Welcome,",
                            fontsize: 30,
                            fontweight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return RegisterScreen();
                                  })
                              );
                            },
                            child: CustomText(
                              text: "Sign Up ",
                              color: primaryColor,
                              fontsize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: "Sign in to Continue",
                            color: Colors.grey,
                            fontsize: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        controller: emailcontroller,
                        text: "Email :",
                        hint: "iamdavid@gmail.com",
                        prefix: Icons.email,
                        onsave: (value) => emailcontroller.text = value!,
                        validator: (String? value) {
                          if (value!.isEmpty||value.contains('@')) {
                            return 'Email is required?';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextFormField(
                        controller: passwordcontroller,
                        text: "Password :",
                        hint: "iamdavid@gmail.com",
                        prefix: Icons.lock,
                        onsave: (value) => passwordcontroller.text = value!,
                        validator: (String? value) {
                          if (value!.isEmpty||value.length<6) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        ispassword:isPassWord,
                        type: TextInputType.visiblePassword,
                        suffix:isPassWord?Icons.visibility:Icons.visibility_off,
                        suffixpressed:(){
                          setState(() {
                            isPassWord=!isPassWord;
                          });

                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return const ForgetPassWord();
                              })
                          );
                        },
                        child: CustomText(
                          text: "Forgot Password?",
                          fontsize: 14,
                          alignment: Alignment.topRight,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: "SIGN IN",
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            print("validated");
                            print(emailcontroller.text);
                            print(passwordcontroller.text);
                            fetchlogin('{$emailcontroller}','{$passwordcontroller}',context);

                          }else{
                            print("Not validated");
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "-OR-",
                        fontsize: 18,
                        alignment: Alignment.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonSocial(
                        text: "Sign In with Facebook",
                        onpressed: () {},
                        imagename: "assets/images/facebook.png.png",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonSocial(
                        text: "Sign In with Google",
                        onpressed: () {},
                        imagename: "assets/images/google.png.png",
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
