import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/music_taste_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FavoriteDrinks extends StatefulWidget {
  const FavoriteDrinks({Key? key}) : super(key: key);

  @override
  _FavoriteDrinksState createState() => _FavoriteDrinksState();
}

class _FavoriteDrinksState extends State<FavoriteDrinks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width*0.1,
            ),
            Text(getTranslated(context, 'favorite_drinks')??"",
              style: AppTextStyle.montserrat(AppColors.black, Get.width*0.06, FontWeight.w600),
            ),
            SizedBox(
              height: Get.width*0.06,
            ),
            Text(getTranslated(context, 'share_any_three')??"",
              style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w400),
            ),
            SizedBox(
              height: Get.width*0.08,
            ),
            Expanded(
              child: Wrap(
                children:
                  List.generate(
                      provider.favoriteDrinks.length,
                          (index) => AppButtonSmall(preference: provider.favoriteDrinks[index])
                  )
                ,
              ),
            ),
          ],
        ),
      )
    );
    });
  }
}
