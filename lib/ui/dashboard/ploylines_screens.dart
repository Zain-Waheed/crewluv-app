import 'package:amigos/ui/dashboard/destinaiton_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PolyLinesScreen extends StatefulWidget {
  const PolyLinesScreen({Key? key}) : super(key: key);

  @override
  _PolyLinesScreenState createState() => _PolyLinesScreenState();
}

class _PolyLinesScreenState extends State<PolyLinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.width * 0.099, left: Get.width * 0.06,),
          child:  Container(
            height: Get.height*0.04,
            width: Get.width*0.09,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            // padding: EdgeInsets.only(top: 4,right: 4,bottom: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      offset: Offset(0, 1),
                      blurRadius: 2)
                ]
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: Get.width*0.04,
                ),
              ),
            ),
          ),
        ),
      ),
      body: DrawMapRoute(),
    );
  }
}
