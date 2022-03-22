import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/controller/auth_viewmodel.dart';
import 'package:ecommerce2/view/widgets/custombutton.dart';
import 'package:ecommerce2/view/widgets/customtext.dart';
import 'package:ecommerce2/view/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var namecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  var phonecontroller=TextEditingController();

  var formkey=GlobalKey<FormState>();
  bool isPassWord=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColorLight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: SingleChildScrollView(
            child:Form(
              key:formkey ,
              child:FutureBuilder(
                future:fetchregister(namecontroller.text,emailcontroller.text,passwordcontroller.text,phonecontroller.text,context),
               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                 return  Column(
                   children: [
                     CustomText(
                       text: "Sign Up",
                       fontsize: 30,
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     CustomTextFormField(
                       controller: namecontroller,
                       text: "Name :",
                       hint: "David Spade",
                       onsave: (value) => namecontroller.text = value!,
                       validator: (String?value) {
                         if (value!.isEmpty) {
                           return 'Your name is required?';
                         }
                         return null;
                       },
                       type: TextInputType.name,
                     ),
                     const SizedBox(
                       height: 35,
                     ),
                     CustomTextFormField(
                       controller:phonecontroller,
                       text: "Phone :",
                       hint: "enter your phone ",
                       onsave: (value) => phonecontroller.text = value!,
                       validator: (String?value) {
                         if (value!.isEmpty) {
                           return 'Your Phone number is required';
                         }return null;
                       },
                       type: TextInputType.name,
                       prefix:Icons.phone,
                     ),
                     const SizedBox(
                       height: 35,
                     ),
                     CustomTextFormField(
                       controller: emailcontroller,
                       text: "Email :",
                       hint: "iamdavid@gmail.com",
                       prefix: Icons.email,
                       onsave: (value)=>emailcontroller.text=value!,
                       validator: (String?value) {
                         if(value!.isEmpty||value.contains('@')){
                           return "Email is required?";
                         }return null;
                       },
                       type: TextInputType.emailAddress,
                     ),
                     const SizedBox(
                       height: 35,
                     ),
                     CustomTextFormField(
                       controller: passwordcontroller,
                       text: "Password :",
                       hint: "*******",
                       prefix: Icons.lock,
                       onsave: (value)=>passwordcontroller.text=value!,
                       validator: (String?value) {
                         if (value!.isEmpty||value.length<6){
                           return 'Password is too short';
                         }
                         return null;
                       },
                       ispassword: true,
                       type: TextInputType.visiblePassword,
                       suffix:isPassWord?Icons.visibility:Icons.visibility_off,
                       suffixpressed:(){
                         setState(() {
                           isPassWord=!isPassWord;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     CustomButton(
                       text: "SIGN UP",
                       onpressed: () {
                         setState(() {
                         if(formkey.currentState!.validate()) {
                           print("validated");
                           print(namecontroller.text);
                           print(emailcontroller.text);
                           print(passwordcontroller.text);
                           fetchregister(
                             '{$namecontroller}',
                             '{$phonecontroller}',
                             '{$emailcontroller}',
                             '{$passwordcontroller}',
                             context,
                           );
                         }else{
                           print("Not validated");
                         } });
                         },
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
