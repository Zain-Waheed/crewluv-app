import 'dart:io';

import 'package:amigos/models/user_model.dart';

class EventModel{
  UserModel? model;
  bool  personalEvent ;
  String? title;
  String? titleImage;
  String? description;
  int? distance;
  String? day;
  String? startTime;
  String? endTime;
  int? withFriends;
  int? maxFriends;
  String? entryType;
  String? liveLocation;
  int? eventStatus;
  List<File> stories=[];
  EventModel({this.title, this.description, this.distance, this.day, this.startTime,this.titleImage,this.endTime,this.withFriends,this.maxFriends,this.entryType,this.liveLocation,required this.personalEvent,this.eventStatus,this.model});


}