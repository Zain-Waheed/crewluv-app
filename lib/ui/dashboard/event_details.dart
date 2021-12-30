import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          function: (){Get.back();},
          title: "event_details",
          backButton: true,
        ),

      ),
      body: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.width*0.1,
                    width: Get.width*0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppImages.profileImage),
                  ),
                ],
              )
            ],
          )
        ],

      ),
    );
  }
}
