import 'package:amigos/models/event_type_model.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier{
  List<EventType> eventTypes=[];
  DashboardProvider(){
    addEvents();
    notifyListeners();
  }

  void addEvents(){
    eventTypes.add(EventType(image: AppImages.naughty, title: 'Naughty' ));
    eventTypes.add(EventType(image: AppImages.balloon, title: 'Birthday' ));
    eventTypes.add(EventType(image: AppImages.ill, title: 'ill' ));
    eventTypes.add(EventType(image: AppImages.laughing, title: 'Laughing' ));
    eventTypes.add(EventType(image: AppImages.happy, title: 'Happy' ));
    eventTypes.add(EventType(image: AppImages.party, title: 'Party' ));
  }

}