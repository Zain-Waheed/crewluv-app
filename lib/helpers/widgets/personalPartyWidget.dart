// import 'package:amigos/utils/colors.dart';
// import 'package:amigos/utils/images.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PersonalPartyWidget extends StatefulWidget {
//   const PersonalPartyWidget({Key? key}) : super(key: key);
//
//   @override
//   _PersonalPartyWidgetState createState() => _PersonalPartyWidgetState();
// }
//
// class _PersonalPartyWidgetState extends State<PersonalPartyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                   vertical: 15, horizontal: 15),
//               decoration: BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                         color: AppColors.opacBlack,
//                         offset: Offset(0, 2),
//                         blurRadius: 5)
//                   ]),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width:Get.width*0.13,
//                         height: Get.width*0.13,
//                         child: Image.asset(AppImages.notification1,fit: BoxFit.fill,),
//                         padding: EdgeInsets.all(1),
//                         decoration: BoxDecoration(
//                           border: Border.all(color:AppColors.themeColor),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       SizedBox(
//                         width: Get.width * 0.02,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 provider.users[0].name ?? "",
//                                 style: AppTextStyle.montserrat(
//                                     AppColors.black3d,
//                                     Get.width * 0.04,
//                                     FontWeight.w500),
//                               ),
//                               const Text(', '),
//                               Text(
//                                 provider.users[0].age.toString(),
//                                 style: AppTextStyle.montserrat(
//                                     AppColors.black3d,
//                                     Get.width * 0.04,
//                                     FontWeight.w500),
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.02,
//                               ),
//                               provider.users[0].isVerified
//                                   ? Image.asset(
//                                 AppImages.verified,
//                                 scale: 3,
//                               )
//                                   : SizedBox(),
//                             ],
//                           ),
//                           SizedBox(
//                             height: Get.width * 0.02,
//                           ),
//                           Row(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 AppImages.locationEvent,
//                                 scale: 3,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.01,
//                               ),
//                               Text(
//                                 provider.users[0].distance.toString(),
//                                 style: AppTextStyle.montserrat(
//                                     AppColors.shadedBlack,
//                                     Get.width * 0.035,
//                                     FontWeight.w400),
//                               ),
//                               Text(
//                                 getTranslated(
//                                   context,
//                                   "miles_away",
//                                 ) ??
//                                     "",
//                                 style: AppTextStyle.montserrat(
//                                     AppColors.shadedBlack,
//                                     Get.width * 0.035,
//                                     FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Image.asset(
//                         AppImages.privateEvent, scale: 4,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: Get.width * 0.05,
//                   ),
//                   Text(
//                     provider.events[0].title ?? "",
//                     style: AppTextStyle.montserrat(AppColors.black,
//                         Get.width * 0.04, FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: Get.width * 0.01,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(width: Get.width*0.02,),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02,
//                             horizontal: Get.width * 0.03),
//                         margin: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02),
//                         decoration: BoxDecoration(
//                           color: AppColors.themeColor.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           provider.events[0].day ?? "",
//                           style: AppTextStyle.montserrat(
//                               AppColors.themeColor,
//                               Get.width * 0.035,
//                               FontWeight.w700),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02,
//                             horizontal: Get.width * 0.03),
//                         margin: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02,
//                             horizontal: Get.width * 0.02),
//                         decoration: BoxDecoration(
//                           color: AppColors.themeColor.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           "${provider.events[0].startTime}-${provider
//                               .events[0].endTime} ",
//                           style: AppTextStyle.montserrat(
//                               AppColors.themeColor,
//                               Get.width * 0.035,
//                               FontWeight.w700),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02,
//                             horizontal: Get.width * 0.03),
//                         margin: EdgeInsets.symmetric(
//                             vertical: Get.width * 0.02),
//                         decoration: BoxDecoration(
//                           color: AppColors.themeColor.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           "${provider.events[0]
//                               .distance}  ${getTranslated(
//                               context, "km")}",
//                           style: AppTextStyle.montserrat(
//                               AppColors.themeColor,
//                               Get.width * 0.035,
//                               FontWeight.w700),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: Get.width * 0.01,
//                   ),
//                   Text(
//                     provider.events[0].description ?? "",
//                     style: AppTextStyle.montserrat(AppColors.lightGrey,
//                         Get.width * 0.035, FontWeight.w400),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(
//                     height: Get.width * 0.04,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         getTranslated(context, widget.index!=2?'my_crew':"joined") ?? '',
//                         style: AppTextStyle.montserrat(AppColors.black,
//                             Get.width * 0.04, FontWeight.w700),
//                       ),
//                       Spacer(),
//                       Stack(
//                         children: [
//                           CrewMembersWidget(
//                               margin: 0, image: AppImages.crew1),
//                           CrewMembersWidget(
//                               margin: 25, image: AppImages.crew2),
//                           Container(
//                               margin:
//                               EdgeInsets.only(left: 50, top: 5),
//                               decoration: BoxDecoration(
//                                   color: AppColors.coalGrey,
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                       color: AppColors.whiteColor)),
//                               height: 35,
//                               width: 35,
//                               child: Center(
//                                 child: Text(
//                                   "+${provider.events[0].maxFriends}",
//                                   style: AppTextStyle.montserrat(
//                                       AppColors.whiteColor,
//                                       Get.width * 0.04,
//                                       FontWeight.w500),
//                                 ),
//                               )),
//                         ],
//                       ),
//                       Text(
//                           "${provider.events[0]
//                               .withFriends}${getTranslated(
//                               context, 'of')} ${provider.events[0]
//                               .maxFriends} ${getTranslated(
//                               context, "friends")} "),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
