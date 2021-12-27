import 'dart:io';

import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/models/chat_model.dart';
import 'package:amigos/models/event_type_model.dart';
import 'package:amigos/models/user_model.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DashboardProvider extends ChangeNotifier{
  List<EventType> eventTypes=[];
  List<PreferenceModel>  favoriteDrinks=[];
  List<PreferenceModel>  musictaste=[];
  List<PreferenceModel>  interests=[];
  List<ChatModel> messages=[];
  List<EventModel> events=[];
  List<UserModel> users=[];

  DashboardProvider(){
    addEvents();
    addFavoriteDrinks();
    addMusicTaste();
    addInterests();
    addEventTypes();
    addMessages();
    addUser();
    notifyListeners();
  }

  List<File> mediaListImages = [
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
  ];

  void addEventTypes(){
    eventTypes.add(EventType(image: AppImages.naughty, title: 'Naughty' ));
    eventTypes.add(EventType(image: AppImages.balloon, title: 'Birthday' ));
    eventTypes.add(EventType(image: AppImages.ill, title: 'ill' ));
    eventTypes.add(EventType(image: AppImages.laughing, title: 'Laughing' ));
    eventTypes.add(EventType(image: AppImages.happy, title: 'Happy' ));
    eventTypes.add(EventType(image: AppImages.party, title: 'Party' ));
  }
   File? profileImage;
  Future getProfileImage(int index) async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
    mediaListImages[index] = File(value!.path);
      notifyListeners();
    });
  }
  void  addFavoriteDrinks(  )
  {
    favoriteDrinks.add(PreferenceModel(name: 'beer',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'gin_tonic',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'martini',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'majito',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'whiskey',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'french_75',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'spritz',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'vesper',isSelected: false));
    favoriteDrinks.add(PreferenceModel(name: 'gimlet',isSelected: false));
  }

  void  addMusicTaste(  )
  {
    musictaste.add(PreferenceModel(name: 'pop',isSelected: false));
    musictaste.add(PreferenceModel(name: 'hip_hop',isSelected: false));
    musictaste.add(PreferenceModel(name: 'rock',isSelected: false));
    musictaste.add(PreferenceModel(name: 'rhythm',isSelected: false));
    musictaste.add(PreferenceModel(name: 'reggae',isSelected: false));
    musictaste.add(PreferenceModel(name: 'funk',isSelected: false));
    musictaste.add(PreferenceModel(name: 'country',isSelected: false));
    musictaste.add(PreferenceModel(name: 'soul',isSelected: false));
    musictaste.add(PreferenceModel(name: 'flock',isSelected: false));
    musictaste.add(PreferenceModel(name: 'jazz',isSelected: false));
    musictaste.add(PreferenceModel(name: 'techno',isSelected: false));
    musictaste.add(PreferenceModel(name: 'house',isSelected: false));
    musictaste.add(PreferenceModel(name: 'classical',isSelected: false));
    musictaste.add(PreferenceModel(name: 'electronic',isSelected: false));
    musictaste.add(PreferenceModel(name: 'culture',isSelected: false));
  }
  void  addInterests(  )
  {
    interests.add(PreferenceModel(name: 'travelling',isSelected: false));
    interests.add(PreferenceModel(name: 'fitness',isSelected: false));
    interests.add(PreferenceModel(name: 'theater',isSelected: false));
    interests.add(PreferenceModel(name: 'dancing',isSelected: false));
    interests.add(PreferenceModel(name: 'cooking',isSelected: false));
    interests.add(PreferenceModel(name: 'drinks',isSelected: false));
    interests.add(PreferenceModel(name: 'politics',isSelected: false));
    interests.add(PreferenceModel(name: 'pets',isSelected: false));
    interests.add(PreferenceModel(name: 'sports',isSelected: false));
    interests.add(PreferenceModel(name: 'surfing',isSelected: false));
    interests.add(PreferenceModel(name: 'festivals',isSelected: false));
    interests.add(PreferenceModel(name: 'party',isSelected: false));
    interests.add(PreferenceModel(name: 'foodie',isSelected: false));
    interests.add(PreferenceModel(name: 'soccer',isSelected: false));
    interests.add(PreferenceModel(name: 'netflix',isSelected: false));
    interests.add(PreferenceModel(name: 'art',isSelected: false));
    interests.add(PreferenceModel(name: 'yoga',isSelected: false));
    interests.add(PreferenceModel(name: 'outdoor',isSelected: false));
    interests.add(PreferenceModel(name: 'climbing',isSelected: false));
    interests.add(PreferenceModel(name: 'cycling',isSelected: false));
    interests.add(PreferenceModel(name: 'running',isSelected: false));
    interests.add(PreferenceModel(name: 'hiking',isSelected: false));
    interests.add(PreferenceModel(name: 'golf',isSelected: false));
    interests.add(PreferenceModel(name: 'photography',isSelected: false));
  }
  void addEvents(){
    events.add(EventModel(title: 'Birthday Bash',description:  AppDummyData.mediumText, distance: 267, day: 'Today',startTime:  '13:30',titleImage: AppImages.balloonSmall,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket'));
    events.add(EventModel( title: 'Bonfire Party', description: AppDummyData.shortText, distance: 187, day: 'Monday', startTime: '13:30',titleImage: AppImages.bonFire,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket'));
    events.add(EventModel(title: 'Friends Mode', description: AppDummyData.shortText,distance:  92,day:  'Thursday', startTime: '13:30',titleImage: AppImages.partySmall,withFriends: 2,maxFriends: 6,entryType: 'buy_ticket'));
  }

  void addMessages()
  {
    messages.add(ChatModel(message: "Lorem ipsum dolor sit amet, consect adip iscing elit, sed do eiusmod. tempor…..incididunt ut labore et dolore magna aliqua",time: '2:00 am',incomingMsg: true));
    messages.add(ChatModel(message: "Hey Julian",time: '2:00 am',incomingMsg: false));
    notifyListeners();
  }
  void addUser(){
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active'));
  }
}