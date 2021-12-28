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
