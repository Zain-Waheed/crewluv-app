import 'dart:io';

import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class DisplayImage extends StatefulWidget {
final  String filePath;
  const DisplayImage({Key? key, required this.filePath}) : super(key: key);

  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          backButton: true,
          function: (){    Get.forceAppUpdate();
          Get.back();},
          title: 'display_Image',
        ),
      ),
      body: Center(
        child: Container(
            child: Image.file(
              File(widget.filePath),
              fit: BoxFit.cover,
              height: Get.width,
            ),
        ),
      ),
    );
  }

}
