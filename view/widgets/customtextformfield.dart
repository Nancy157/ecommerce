import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';

import 'customtext.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final IconData prefix;
  final void Function(String?)?onsave;
  final FormFieldValidator<String>? validator;
  final bool ispassword;
  final TextEditingController controller;
  final TextInputType type;
  final IconData? suffix;
  final void Function()?suffixpressed;


  //constructor for FormField

   CustomTextFormField({
  required this.text,
   this.hint='',
   this.prefix=Icons.account_circle_outlined,
  this.onsave,
     required this.validator,
    this.ispassword=false,
    required this.controller,
     required this.type,
     this.suffix,
     this.suffixpressed,
});
@override
Widget build(BuildContext context) {
  return Container(
    child: Column(
      children: [
        CustomText(
          text: text,
          color: Colors.grey.shade900,
          fontsize: 14,
        ),
        TextFormField(
          obscureText:ispassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 18,),
            fillColor: Colors.grey,
            prefixIcon: Icon(prefix,color:primaryColor,
              ),
            suffixIcon:suffix!=null?IconButton(
                onPressed:(){
                  suffixpressed;
                },
                icon:Icon(suffix)):null,
          ),
          onSaved:onsave,
          validator:validator,
          controller:controller,
          keyboardType:type,


        ),

      ],
    ),


  );
}}
