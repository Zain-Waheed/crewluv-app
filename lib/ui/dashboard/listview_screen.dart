import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        backgroundColor: Colors.transparent,
        body:  SingleChildScrollView(
          child: Column(
            children: List.generate(provider.events.length, (index) => GestureDetector(
                onTap: (){
                  Get.dialog(EventWidget(user: provider.users.first, event :provider.events.first ));
                },
                child: EventDescriptionWidget(model: provider.events[index??0],titleImage: true,))),
          ),
        ),
      );
    });
  }
}
