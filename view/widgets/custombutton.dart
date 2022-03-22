
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
 final void Function()? onpressed;
  CustomButton({required this.text,required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color:primaryColor,
          borderRadius:BorderRadius.circular(25),
        ),
        child: TextButton(
          onPressed:onpressed,
          child:CustomText(
            text:text,
            color:Colors.white,
            alignment:Alignment.center,
            fontsize:14,
          ),
        ),
      ),
    );
  }
}
