import 'package:ecommerce2/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
class CustomButtonSocial extends StatelessWidget {
final String text;
final void Function()? onpressed;
final String imagename;
CustomButtonSocial({required this.text,required this.onpressed,required this.imagename});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.all(10),
      width:double.infinity,
      decoration: BoxDecoration(
        color:Colors.grey.shade100,
        borderRadius:BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed:onpressed,
        child:Row(children:[
            Image.asset(imagename),
            const SizedBox(width:80,),
            CustomText(
              text:text,
              fontsize:14,
              alignment:Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
