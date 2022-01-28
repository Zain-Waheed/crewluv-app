import 'dart:io';

import 'package:amigos/helpers/bottom_sheets/links_bottom_sheet.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/chat_details_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/display_item.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:amigos/utils/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatDetails extends StatefulWidget {
  String name;

  ChatDetails({ required this.name});

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  TextEditingController sendMessageController = TextEditingController();
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height*0.04),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height*0.045,
                      width: Get.width*0.1,
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
                            size: Get.width*0.045,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.15,
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
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.0,left: Get.width*0.03,right:Get.width*0.03),
                  child: ListView.builder(
                      itemCount: provider.messages.length,
                      shrinkWrap: true,
                      reverse:true,
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                      itemBuilder: (context, index) {
                        return
                          provider.messages[index].incomingMsg == true?
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment:
                            provider.messages[index].incomingMsg!
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: Get.width * 0.15, left: Get.width * 0.0,right:Get.width * 0.02 ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all(
                                    color: AppColors.blue,
                                    width: Get.height * 0.002),
                                ),
                                child: const CircleAvatar(
                                  radius: 16,
                                  backgroundImage: CachedNetworkImageProvider(
                                    'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                                  ),
                                ),
                              ),
                              chatBubbleReceiver(provider,index),
                            ],
                          ):
                          Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment:
                          provider.messages[index].incomingMsg!
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                             chatBubbleSender(provider,index),
                            Container(
                              margin: EdgeInsets.only(
                                  top: Get.width * 0.12,
                                  left: Get.width * 0.02,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.blue,
                                    width: Get.height * 0.002),
                              ),
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundImage: CachedNetworkImageProvider(
                                  'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                                ),
                              ),
                            ),
                          ],
                        );
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
                            offset: const Offset(0,-4),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:() async{
                              result=  await Get.bottomSheet(
                                   const LinksBottomSheet(),backgroundColor: Colors.transparent,
                              );
                              provider.messages.insert(
                                0,
                                  ChatDetailsModel(
                                  file:result!.files.single.path,
                                  time: "2:00",
                                  incomingMsg: false,
                                  messageType: 1
                              ));
                              setState(() {

                              });
                            },
                            child: Container(
                              width: Get.width * 0.10,
                              height: Get.width * 0.10,
                              margin: EdgeInsets.only(right: Get.width * 0.01),
                              decoration: BoxDecoration(
                                color: AppColors.whiteDark,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.attach,
                                  width: Get.width * 0.04,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
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
                                contentPadding: EdgeInsets.only(top: Get.height*0.015,bottom:Get.height*0.015,left: Get.width*0.03 ),
                                filled: true,
                                fillColor: AppColors.whiteDark,
                                hintText: getTranslated(
                                    Get.context, "start_typing"),
                                hintStyle: AppTextStyle.montserrat(
                                    AppColors.blackLite,
                                    Get.width * 0.03,
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
                              if(sendMessageController.text.isNotEmpty){
                                provider.messages.insert(
                                    0,
                                    ChatDetailsModel(
                                        message: sendMessageController.text
                                            .toString(),
                                        time: "2:00",
                                        incomingMsg: false,
                                        messageType: 0
                                    )
                                );

                              }else
                                {
                                  Fluttertoast.showToast(
                                    msg: getTranslated(context, 'enter_text')??"",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,

                                  );
                                }
                              sendMessageController.clear();
                              // FocusScope.of(context).requestFocus(new FocusNode());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: Get.width * 0.02),
                              decoration: BoxDecoration(
                                gradient: AppColors.orangeGradientColor,
                                color: AppColors.whiteDark,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AppImages.send,width: Get.width*0.04,height: Get.width*0.04,),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(
                height: Get.width*0.04,
              ),
            ],
          ),
        );
      },
    );

  }

  chatBubbleSender(DashboardProvider provider, int index) {
    if(provider.messages[index].messageType==0)
    {
      return   Container(
        alignment:Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(5),
        constraints: BoxConstraints(
            minWidth: Get.width * 0.2,
            maxWidth: Get.height * 0.3),
        decoration: BoxDecoration(
          color:AppColors.pink,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Get.width * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                provider.messages[index].message ??
                    "",
                style: AppTextStyle.montserrat(
                    AppColors.greyDark,
                    Get.height * 0.018,
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
                    provider.messages[index].time ?? "",
                    style: AppTextStyle.montserrat(
                       AppColors.greyDark,
                        Get.height * 0.015,
                        FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else
    if(provider.messages[index].messageType==1)
    {
      return    GestureDetector(
        onTap:(){
          Get.to(DisplayImage(filePath:provider.messages[index].file ?? ""));
        },
        child:  Container(
          // color: AppColors.whiteDark,
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(5),
          constraints: BoxConstraints(
            minWidth: Get.width * 0.2,
            maxWidth: Get.height * 0.3,
          ),
          decoration: BoxDecoration(
            color:AppColors.pink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          child:
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(
                  File( provider.messages[index].file ?? ""),
                  fit: BoxFit.fill,
                  height: Get.width * 0.6,
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
                           AppColors.greyDark,
                          Get.height * 0.015,
                          FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
  chatBubbleReceiver(DashboardProvider provider, int index) {
    if(provider.messages[index].messageType==0)
    {
      return   Container(
        alignment:Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(5),
        constraints: BoxConstraints(
            minWidth: Get.width * 0.2,
            maxWidth: Get.height * 0.3),
        decoration: BoxDecoration(
          color:AppColors.whiteDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Get.width * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                provider.messages[index].message ??
                    "",
                style: AppTextStyle.montserrat(
                    provider.messages[index]
                        .incomingMsg ==
                        true
                        ? AppColors.black
                        : AppColors.greyDark,
                    Get.height * 0.018,
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
                    provider.messages[index].time ?? "",
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
      );
    }else
    if(provider.messages[index].messageType==1)
    {
      return    GestureDetector(
        onTap:(){
          Get.to(DisplayImage(filePath:provider.messages[index].file ?? ""));
        },
        child:  Container(
          color: AppColors.whiteDark,
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(5),
          constraints: BoxConstraints(
            minWidth: Get.width * 0.2,
            maxWidth: Get.height * 0.3,
          ),
          child:
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(
                  File( provider.messages[index].file ?? ""),
                  fit: BoxFit.cover,
                  height: Get.width * 0.6,
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
      );
    }
  }
}
