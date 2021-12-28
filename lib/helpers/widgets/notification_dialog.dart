import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationDialogBox extends StatefulWidget {
  const NotificationDialogBox({Key? key}) : super(key: key);

  @override
  _NotificationDialogBoxState createState() => _NotificationDialogBoxState();
}

class _NotificationDialogBoxState extends State<NotificationDialogBox> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-5,0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceIn,
  ));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
        backgroundColor: AppColors.black.withOpacity(0.4),
        body:Center(
          child: SingleChildScrollView(
            child: Container(
              width: Get.width*0.9,
              height: Get.width*1.1,
              padding: EdgeInsets.symmetric(vertical: Get.height*0.03),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height:Get.width*0.1,
                  ),
                  Stack(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.heartGreen,scale: 4,),
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.progress, width: Get.height * 0.002),
                            ),
                            child:  const CircleAvatar(
                              radius: 40,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.progress, width: Get.height * 0.002),
                            ),
                            child:  const CircleAvatar(
                              radius: 40,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  ),
                  SizedBox(
                    height:Get.width*0.2,
                  ),
                  Text("${getTranslated(context, 'you_added')??""} "
                      "Jeseln"
                      " ${getTranslated(context, 'to_your_event_crew')??""}",
                  style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),
                  ),
                  SizedBox(
                    height:Get.width*0.03,
                  ),
                  Text("${getTranslated(context, 'send_message_to')??""} "
                      "Jeseln"
                      " ${getTranslated(context, 'to_your_event_crew')??""}",
                    style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w400),
                  ),
                  SizedBox(
                    height:Get.width*0.03,
                  ),
                  AppButton(buttonText: 'message', onpressed: (){}, width:Get.width*0.8, isWhite: false),
                  SizedBox(
                    height:Get.width*0.03,
                  ),
                  AppButton(buttonText: 'keep_swiping', onpressed: (){}, width:Get.width*0.8, isWhite: true)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
