import 'package:amigos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppBarButton extends StatefulWidget {
 bool backButton;
 VoidCallback function;

 AppBarButton({required this.backButton,required this.function});

  @override
  _AppBarButtonState createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15 , horizontal: 10),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          elevation: 10
        ),
        onPressed: widget.function,
        child: Icon(widget.backButton==true? Icons.arrow_back_ios: Icons.clear,color: AppColors.black,),

      ),
    );
  }
}
