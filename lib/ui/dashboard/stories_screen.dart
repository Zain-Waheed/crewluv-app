import 'dart:io';

import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/global_function.dart';
import 'package:amigos/utils/images.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final StoryController storyController = StoryController();
  File? pickedFile;
  List<String> urls=[
    "https://images.unsplash.com/photo-1553531384-cc64ac80f931?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_)
        {
          return Scaffold(
            body: Stack(
              children: [
                StoryView(
                  storyItems: List.generate(
                    urls.length,
                        (index)
                    =>  StoryItem.pageImage(
                      url:urls[index],
                      caption: "Still sampling",
                      controller: storyController,
                    ),
                  ),
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  controller: storyController,
                  onComplete: () {
                    Get.back();
                  },
                ),
                Align(
                  alignment:Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height*0.07,left:Get.width*0.06 ),
                    child: GestureDetector(
                      onTap: (){
                        pickFile(provider);
                      },
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Image.asset(AppImages.profileImage,height: Get.width*0.15,width: Get.width*0.15,),
                            Visibility(
                              child: Positioned(
                                right: 2,
                                bottom:8 ,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.themeColor,
                                  ),
                                  child: Icon(Icons.add,color: AppColors.whiteColor,size: Get.width*0.04,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  void pickFile(DashboardProvider provider) {
    final services = getFile();
    services.pickFile().then(  (value)async {
      setState(() {
        provider.events[0].stories.add(value);
      });
    }
    );
  }
}
