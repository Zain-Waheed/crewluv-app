import 'package:amigos/utils/colors.dart';
import 'package:flutter/material.dart';

class CrewMembersWidget extends StatefulWidget {
 double margin;
 String image;

 CrewMembersWidget({required this.margin, required this.image});

  @override
  _CrewMembersWidgetState createState() => _CrewMembersWidgetState();
}

class _CrewMembersWidgetState extends State<CrewMembersWidget> {
  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(left: widget.margin),
      height: 40,
      width: 40,
      padding: EdgeInsets.all(2),
      decoration:widget.margin==0?BoxDecoration(
        border: Border.all(color: AppColors.themeColor,width: 2),

        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      ):null,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          widget.image,
        ),
        radius: 20,
      ),
    );
  }
}
