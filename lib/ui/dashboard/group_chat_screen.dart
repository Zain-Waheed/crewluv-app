import 'package:amigos/helpers/bottom_sheets/links_bottom_sheet.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/chat_details_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/chat_box_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GroupChatt extends StatefulWidget {
 final  String name;
  const GroupChatt({Key? key, required this.name}) : super(key: key);

  @override
  _GroupChattState createState() => _GroupChattState();
}

class _GroupChattState extends State<GroupChatt> {
  @override
  Widget build(BuildContext context) {
    TextEditingController sendMessageController = TextEditingController();
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: AppBar(
          leading: Container(
            height: Get.height*0.06,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 4) ,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      offset: Offset(0, 4),
                      blurRadius: 5.0)
                ]),
            child: Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: Get.width*0.06,
                ),
              ),
            ),
          ),
          title: GestureDetector(
            onTap:(){
              Get.to( const ChatBox(name: 'American Party',));
            },
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.maroon, width: Get.height * 0.002),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                            AppImages.crew2
                        ),
                        radius: 12,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:10),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          AppImages.crew2
                        ),
                        radius: 14,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20,),
                        decoration: BoxDecoration(
                            color: AppColors.greyText,
                            shape: BoxShape.circle,
                        ),
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text(
                            "+9",
                            style: AppTextStyle.montserrat(
                                AppColors.whiteColor,
                                Get.width * 0.02,
                                FontWeight.w500),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text(
                  widget.name,
                  style: AppTextStyle.montserrat(
                      AppColors.black, Get.width * 0.05, FontWeight.bold),
                ),
              ],
            ),
          ),
          leadingWidth: Get.width * 0.2,
          toolbarHeight: Get.width * 0.3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0,left: Get.width*0.03,right:Get.width*0.03),
              child: ListView.builder(
                  itemCount: provider.messages.length,
                  shrinkWrap: true,
                  reverse:true,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment:
                      provider.messages[index].incomingMsg!
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible:
                          provider.messages[index].incomingMsg == true
                              ? true
                              : false,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: Get.width * 0.15,
                                left: Get.width * 0.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.blue,
                                  width: Get.height * 0.002),
                            ),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                              ),
                            ),
                          ),
                        ),
                        ChatBubble(
                          clipper:
                          provider.messages[index].incomingMsg == true
                              ? ChatBubbleClipper3(
                              type: BubbleType.receiverBubble)
                              : ChatBubbleClipper3(
                              type: BubbleType.sendBubble),
                          alignment:
                          provider.messages[index].incomingMsg == true
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          margin: EdgeInsets.only(top: 20),
                          backGroundColor:
                          provider.messages[index].incomingMsg == true
                              ? AppColors.whiteDark
                              : AppColors.pinkLight,
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: Get.width * 0.2,
                                maxWidth: Get.height * 0.3),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: Get.width * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    provider.messages[index].message ??
                                        "",
                                    style: AppTextStyle.montserrat(
                                        provider.messages[index]
                                            .incomingMsg ==
                                            true
                                            ? AppColors.black
                                            : AppColors.greyDark,
                                        Get.height * 0.02,
                                        FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        provider.messages[index].time ??
                                            "",
                                        style: AppTextStyle.montserrat(
                                            provider.messages[index]
                                                .incomingMsg ==
                                                true
                                                ? AppColors.black
                                                : AppColors.greyDark,
                                            Get.height * 0.015,
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                          provider.messages[index].incomingMsg == true
                              ? false
                              : true,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: Get.width * 0.15,
                                left: Get.width * 0.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.blue,
                                  width: Get.height * 0.002),
                            ),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                    // return Column(
                    //   children: [
                    //     Visibility(
                    //       visible:index%2==0?true:false,
                    //       child: Padding(
                    //         padding:  EdgeInsets.symmetric(vertical: Get.height*0.01),
                    //         child: Text('Today',
                    //           style: AppTextStyle.poppins(
                    //               AppColors.grey, Get.height * 0.02,
                    //               FontWeight.w500),
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: Get.height*0.01,horizontal: Get.height*0.02),
                    //       child: Align(
                    //           alignment: provider.messages[index].incomingMsg==true?Alignment.topLeft:Alignment.topRight,
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               Container(
                    //                 padding: EdgeInsets.all(Get.height*0.02),
                    //                 constraints: BoxConstraints(minWidth: Get.width*0.3, maxWidth: Get.height*0.3),
                    //                 decoration: BoxDecoration(
                    //                   border:Border.all(
                    //                     color: AppColors.blackLite,
                    //                   ),
                    //                   color: provider.messages[index].incomingMsg==true?AppColors.whiteColor:AppColors.pinkLight,
                    //                   borderRadius: const BorderRadius.only(
                    //                     topLeft: Radius.circular(12),
                    //                     topRight: Radius.circular(12),
                    //                     bottomRight: Radius.circular(12),
                    //                     bottomLeft: Radius.circular(12),
                    //                   ),
                    //
                    //                 ),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(provider.messages[index].message?? "",
                    //                       style: AppTextStyle.montserrat(
                    //                           provider.messages[index].incomingMsg==true?AppColors.grey:AppColors.greyDark, Get.height * 0.02,
                    //                           FontWeight.w400),),
                    //                     Text(provider.messages[index].time?? "", style: AppTextStyle.montserrat(
                    //                         provider.messages[index].incomingMsg==true?AppColors.grey:AppColors.greyDark, Get.height * 0.015,
                    //                         FontWeight.w400),),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           )
                    //       ),
                    //     ),
                    //   ],
                    // );
                  }),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal:  Get.width*0.03,vertical:Get.width*0.03),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.opacBlack,
                        offset: const Offset(5,0.0),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.bottomSheet(
                            const LinksBottomSheet()
                          );
                        },
                        child: Container(
                          width: Get.width * 0.12,
                          height: Get.width * 0.12,
                          margin: EdgeInsets.only(right: Get.width * 0.01),
                          decoration: BoxDecoration(
                            color: AppColors.whiteDark,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.attach,
                              width: Get.width * 0.06,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.67,
                        child: TextField(
                          controller: sendMessageController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixStyle: TextStyle(
                              color: AppColors.grey,
                            ),
                            filled: true,
                            fillColor: AppColors.whiteDark,
                            hintText: getTranslated(
                                Get.context, "start_typing"),
                            hintStyle: AppTextStyle.montserrat(
                                AppColors.blackLite,
                                Get.width * 0.04,
                                FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.whiteDark,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.whiteDark,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.whiteDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          provider.messages.insert(
                              0,
                              ChatDetailsModel(
                                  message: sendMessageController.text
                                      .toString(),
                                  time: "2:00",
                                  incomingMsg: false));
                          sendMessageController.clear();
                          // FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: AppColors.orangeGradientColor,
                            color: AppColors.whiteDark,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(AppImages.send,width: Get.width*0.05,height: Get.width*0.05,),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );},);
  }

}
