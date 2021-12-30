import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/chat_details_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:amigos/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class Chat extends StatefulWidget {
  String name;

  Chat({ required this.name});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController sendMessageController = TextEditingController();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: AppBar(
              leading: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ]),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                  ),
                ),
              ),
              title: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.08,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.blue, width: Get.height * 0.002),
                    ),
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Text(
                    widget.name,
                    style: AppTextStyle.montserrat(
                        AppColors.black, Get.width * 0.05, FontWeight.bold),
                  ),
                ],
              ),
              centerTitle: true,
              leadingWidth: Get.width * 0.2,
              toolbarHeight: Get.width * 0.3,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: ListView.builder(
                        itemCount: provider.messages.length,
                        reverse: true,
                        shrinkWrap: true,
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
                        color: AppColors.white,
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(
                        //   vertical: Get.width * 0.01,
                        //   horizontal: Get.width * 0.03,
                        // ),
                        height: Get.height * 0.12,
                        width: Get.width,
                        child: Row(
                          children: [
                            PopupMenuButton(
                              child:Container(
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
                                itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        child: Text("First"),
                                        value: 1,
                                      ),
                                      const PopupMenuItem(
                                        child: Text("Second"),
                                        value: 2,
                                      )
                                    ]),
                            Container(
                              height: Get.height * 0.06,
                              width: Get.width * 0.65,
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
                                width: Get.width * 0.18,
                                height: Get.width * 0.09,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.01),
                                decoration: BoxDecoration(
                                  gradient: AppColors.orangeGradientColor,
                                  color: AppColors.whiteDark,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  getTranslated(context, 'send') ?? "",
                                  style: AppTextStyle.montserrat(
                                    AppColors.white,
                                    Get.width * 0.04,
                                    FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }
}
