import 'dart:io';

import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/models/filter_model.dart';
import 'package:amigos/models/group_chat_model.dart';
import 'package:amigos/models/mood_model.dart';
import 'package:amigos/models/personal_chat_model.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/models/chat_details_model.dart';
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
  List<ChatDetailsModel> messages=[];
  List<EventModel> events=[];
  List<UserModel> users=[];
  List<PersonalChatModel> personalChats=[];
  List<GroupChatModel> groupChats =[];
  FilterModel filters=FilterModel();
  String userEmail='';
  String dob='';
  String phone='';
  int dashboardIndex = 0;
  int allEventPageIndex =0;
  int chatPageIndex = 0;

  List<String> names =[
    "sophie",
    "lee",
    "shaun",
    "sasha",
  ];

  DashboardProvider(){
    addEvents();
    addFavoriteDrinks();
    addFilters();
    addMusicTaste();
    addInterests();
    addEventTypes();
    addMessages();
    addChats();
    addGroupChat();
    addUser();
    notifyListeners();
  }
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  List<int> formCheck= [-1,-1,-1,-1,-1,-1,-1,-1,1];
  int pageIndex = 0;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  int gender=0;


  List<File> mediaListImages = [
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
  ];
  List<MoodModel> moods=[
    MoodModel(AppImages.walking, AppImages.runningIcon, 'Walking'),
    MoodModel(AppImages.birthday, AppImages.balloon, 'Birthday'),

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
    events.add(EventModel(title: 'Birthday Bash',description:  AppDummyData.mediumText, distance: 267, day: 'Today',startTime:  '13:30',titleImage: AppImages.balloonSmall,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true));
    events.add(EventModel( title: 'Bonfire Party', description: AppDummyData.shortText, distance: 187, day: 'Monday', startTime: '13:30',titleImage: AppImages.bonFire,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true));
    events.add(EventModel(title: 'Friends Mode', description: AppDummyData.shortText,distance:  92,day:  'Thursday', startTime: '13:30',titleImage: AppImages.partySmall,withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: false,));
  }

  void addMessages()
  {
    messages.add(ChatDetailsModel(message: "Lorem ipsum dolor sit amet, consect adip iscing elit, sed do eiusmod. tempor…..incididunt ut labore et dolore magna aliqua",time: '2:00 am',incomingMsg: true));
    messages.add(ChatDetailsModel(message: "Hey Julian",time: '2:00 am',incomingMsg: false));
    notifyListeners();
  }

  void addUser(){
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active'));
  }
  void addChats(){
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Julian Dasilva', lastMessage: AppDummyData.shortText,time: 'now'));
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Mike Lyne', lastMessage: AppDummyData.shortText,time:"3 min ago"));
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Jane Doe', lastMessage: AppDummyData.shortText,time:" yesterday"));
  }
  void addGroupChat()
  {
    groupChats.add(GroupChatModel(chatName: 'Birthday party', people: names, lastMessage: AppDummyData.shortText, date: '10/7/2017', lastMessageSender: names.first));
    groupChats.add(GroupChatModel(chatName: 'AmericanParty', people: names, lastMessage: AppDummyData.shortText, date: '10/7/2017', lastMessageSender: names.first));

  }
  void addFilters(){
    filters!.musicTaste.add(PreferenceModel(name:'pop' ,isSelected: false));
    filters!.musicTaste.add(PreferenceModel(name:'rock' ,isSelected: false));
    filters!.musicTaste.add(PreferenceModel(name:'jazz' ,isSelected: false));
    filters!.musicTaste.add(PreferenceModel(name:'soul' ,isSelected: false));
    filters!.musicTaste.add(PreferenceModel(name:'funk' ,isSelected: false));
    //
    filters!.eventTypes.add(PreferenceModel(name:"private_events",isSelected: false));
    filters!.eventTypes.add(PreferenceModel(name:"communication_events",isSelected: false));
    filters!.eventTypes.add(PreferenceModel(name:"activites",isSelected: false));
    //
    filters!.friend.add(PreferenceModel(name:"all",isSelected: false));
    filters!.friend.add(PreferenceModel(name:"favourites",isSelected: false));
    filters!.friend.add(PreferenceModel(name:"contact_list",isSelected: false));
    filters!.friend.add(PreferenceModel(name:"squard",isSelected: false));
    //
    filters!.timeDuration.add(PreferenceModel(name:"now",isSelected: false));
    filters!.timeDuration.add(PreferenceModel(name:"today",isSelected: false));
    filters!.timeDuration.add(PreferenceModel(name:"tomorrow",isSelected: false));
    filters!.timeDuration.add(PreferenceModel(name:"week",isSelected: false));





  }
  void update(){
    notifyListeners();
  }
}