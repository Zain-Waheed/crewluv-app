import 'package:amigos/models/event_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MoodTypeWidget extends StatefulWidget {
  EventType type;
  bool isTitle;
  MoodTypeWidget({required this.type, this.isTitle=true});

  @override
  _MoodTypeWidgetState createState() => _MoodTypeWidgetState();

}

class _MoodTypeWidgetState extends State<MoodTypeWidget> {
  @override
  Widget build(BuildContext context) {
     return Container(
      height: Get.width*0.18,
      width: Get.width*0.15,
      margin: const EdgeInsets.only(right: 10),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Image.asset(widget.type.image,scale: 4,),
          Visibility(
            visible: widget.isTitle,
              child: Text(widget.type.title)),
        ],
      ),
    );
  }
}
