import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/send_invite.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCrew extends StatefulWidget {
  const NewCrew({Key? key}) : super(key: key);

  @override
  _NewCrewState createState() => _NewCrewState();
}

class _NewCrewState extends State<NewCrew> {
  bool isChecked = false;
  List<String> favorites=[
    "Julie",
    "Justin",
    "Mark",
  ];
  List<bool> favoriteCheckValue=[
    false,
    false,
    false,
  ];
  List<String> contacts=[
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
  ];
  List<bool> contactsCheckValue=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          function: () {Get.back();},
          title: "my_new_crew",
          backButton: true,
        ),

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width*0.04,
            ),
            Text(
              getTranslated(context, 'favorites')??"",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack,
                  Get.width*0.05,
                  FontWeight.w500,
              ),
            ),
           Column(
             children:
               List.generate(
                   favorites.length,
                       (index) => crewWidget(favorites[index],favoriteCheckValue[index])
               )
             ,
           ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: Get.width*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTranslated(context, 'my_contacts')??"",
                    style: AppTextStyle.montserrat(
                      AppColors.shadedBlack,
                      Get.width*0.045,
                      FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        SendInvite()
                      );
                    },
                    child: Text(
                      getTranslated(context, 'send_invite')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.lightGrey,
                        Get.width*0.045,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:
                  List.generate(
                      contacts.length,
                          (index) => crewWidget(contacts[index],contactsCheckValue[index])
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.width*0.04,
            ),
            AppButton(
                buttonText: 'create_crew',
                onpressed: (){},
                width: Get.width*1,
                isWhite: false,
            ),
            SizedBox(
              height: Get.width*0.04,
            ),
          ],
        ),
      ),
    );
  }

  crewWidget(String title,bool checkValue) {
    return
      Padding(
        padding: EdgeInsets.symmetric(vertical: Get.width*0.01),
        child: Row(
          children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.themeColor, width: Get.height * 0.002),
            ),
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: CachedNetworkImageProvider(
                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
              ),
            ),
          ),
          SizedBox(
            width: Get.width*0.03,
          ),
          Text(title,
            style: AppTextStyle.montserrat(
              AppColors.shadedBlack,
              Get.width*0.05,
              FontWeight.w500,
            ),),
          Spacer(),
          Checkbox(
            value: checkValue,
            activeColor: AppColors.themeColor,
            onChanged: (value) {
              checkValue = value!;
              setState(() {});
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
