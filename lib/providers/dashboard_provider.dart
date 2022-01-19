import 'dart:io';

import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/models/crew_model.dart';
import 'package:amigos/models/filter_model.dart';
import 'package:amigos/models/group_chat_model.dart';
import 'package:amigos/models/mood_model.dart';
import 'package:amigos/models/notification_model.dart';
import 'package:amigos/models/personal_chat_model.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/models/chat_details_model.dart';
import 'package:amigos/models/event_type_model.dart';
import 'package:amigos/models/ticket_model.dart';
import 'package:amigos/models/user_model.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:emojis/emoji.dart';
class DashboardProvider extends ChangeNotifier{
  List<EventType> eventTypes=[];
  List<PreferenceModel>  favoriteDrinks=[];
  List<PreferenceModel>  musicTaste=[];
  List<PreferenceModel>  interests=[];
  List<PreferenceModel>  userInterests=[];
  List<PreferenceModel>  userMusicTaste=[];

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
  int faqIndex=0;
  String mood= AppImages.party;
  List<CrewModel> crews=[];
  List<NotificationModel> notifications =[];
  List<TicketModel> tickets=[];
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
    addNotifications();
    addUserInterets();
    addCrews();
    addUserMusicTaste();
    addEventTypes();
    addMessages();
    addChats();
    addGroupChat();
    addUser();
    addTickets();
    notifyListeners();
  }
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  List<int> formCheck= [-1,-1,-1,-1,-1,-1,-1,-1,-1];
  int pageIndex = 0;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController moodController=new TextEditingController();
  int gender=0;
  List<File> mediaListImages = [
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
  ];

  File? profileImage;
  Future getProfileImage(int index) async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      mediaListImages[index] = File(value!.path);
      notifyListeners();
    });
  }

  List<MoodModel> moods=[
    MoodModel(AppImages.walking, AppImages.runningIcon, 'Walking'),
    MoodModel(AppImages.birthday, AppImages.balloon, 'Birthday'),
    MoodModel(AppImages.birthday, AppImages.balloon, 'Birthday'),
  ];

  void addCrews(){
    crews.add(CrewModel('hassan', false, false));
    crews.add(CrewModel('usama', false, true));
    crews.add(CrewModel('zain', false, false));
    crews.add(CrewModel('hammad', false, false));
    crews.add(CrewModel('muneed', false, false));
    crews.add(CrewModel('hamza', false, true));

  }

  void addEventTypes(){
    eventTypes.add(EventType(image: Emojis.hamburger, title: 'Naughty' ));
    eventTypes.add(EventType(image: Emojis.birthdayCake, title: 'Birthday' ));
    eventTypes.add(EventType(image: Emojis.hospital, title: 'ill' ));
    eventTypes.add(EventType(image: Emojis.smilingFace, title: 'Laughing' ));
    eventTypes.add(EventType(image: Emojis.smilingFaceWithHeartEyes, title: 'Happy' ));
    eventTypes.add(EventType(image: Emojis.partyPopper, title: 'Party' ));
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
  void addNotifications(){
    notifications.add(NotificationModel(name: 'Nelly,',age: 30,time: 'now',description: AppDummyData.mediumText,image: AppImages.notification1));
    notifications.add(NotificationModel(name: 'joseph,',age: 29,time: '2 min ago',description: AppDummyData.mediumText, image:AppImages.notification2));
    notifications.add(NotificationModel(name: 'joseph,',age: 29,time: '2 min ago',description: AppDummyData.mediumText,image:AppImages.notification1));


  }

  void  addMusicTaste(  )
  {
    musicTaste.add(PreferenceModel(name: 'pop',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'hip_hop',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'rock',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'rhythm',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'reggae',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'funk',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'country',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'soul',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'flock',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'jazz',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'techno',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'house',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'classical',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'electronic',isSelected: false));
    musicTaste.add(PreferenceModel(name: 'culture',isSelected: false));
  }
  void  addUserMusicTaste(  )
  {
    userMusicTaste.add(PreferenceModel(name: 'pop',isSelected: true));
    userMusicTaste.add(PreferenceModel(name: 'hip_hop',isSelected: true));
    userMusicTaste.add(PreferenceModel(name: 'rock',isSelected: true));
    userMusicTaste.add(PreferenceModel(name: 'rhythm',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'reggae',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'funk',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'country',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'soul',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'flock',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'jazz',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'techno',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'house',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'classical',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'electronic',isSelected: false));
    userMusicTaste.add(PreferenceModel(name: 'culture',isSelected: false));
  }
  void  addInterests()
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
    events.add(EventModel(title: 'Birthday Bash',description:  AppDummyData.mediumText, distance: 267, day: 'Today',startTime:  '13:30',titleImage: AppImages.balloonSmall,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true,));
    events.add(EventModel( title: 'Bonfire Party', description: AppDummyData.shortText, distance: 187, day: 'Monday', startTime: '13:30',titleImage: AppImages.bonFire,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true));
    events.add(EventModel(title: 'Friends Mode', description: AppDummyData.shortText,distance:  92,day:  'Thursday', startTime: '13:30',titleImage: AppImages.partySmall,withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: false,));
    events.add(EventModel(title: 'Birthday Bash',description:  AppDummyData.mediumText, distance: 267, day: 'Today',startTime:  '13:30',titleImage: AppImages.balloonSmall,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true));
    events.add(EventModel( title: 'Bonfire Party', description: AppDummyData.shortText, distance: 187, day: 'Monday', startTime: '13:30',titleImage: AppImages.bonFire,endTime: '16:30',withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: true));
    events.add(EventModel(title: 'Friends Mode', description: AppDummyData.shortText,distance:  92,day:  'Thursday', startTime: '13:30',titleImage: AppImages.partySmall,withFriends: 2,maxFriends: 6,entryType: 'buy_ticket',personalEvent: false,));
  }
  void  addUserInterets()
  {
    userInterests.add(PreferenceModel(name: 'travelling',isSelected: true));
    userInterests.add(PreferenceModel(name: 'fitness',isSelected: true));
    userInterests.add(PreferenceModel(name: 'theater',isSelected: true));
    userInterests.add(PreferenceModel(name: 'dancing',isSelected: false));
    userInterests.add(PreferenceModel(name: 'cooking',isSelected: false));
    userInterests.add(PreferenceModel(name: 'drinks',isSelected: false));
    userInterests.add(PreferenceModel(name: 'politics',isSelected: false));
    userInterests.add(PreferenceModel(name: 'pets',isSelected: false));
    userInterests.add(PreferenceModel(name: 'sports',isSelected: false));
    userInterests.add(PreferenceModel(name: 'surfing',isSelected: false));
    userInterests.add(PreferenceModel(name: 'festivals',isSelected: false));
    userInterests.add(PreferenceModel(name: 'party',isSelected: false));
    userInterests.add(PreferenceModel(name: 'foodie',isSelected: false));
    userInterests.add(PreferenceModel(name: 'soccer',isSelected: false));
    userInterests.add(PreferenceModel(name: 'netflix',isSelected: false));
    userInterests.add(PreferenceModel(name: 'art',isSelected: false));
    userInterests.add(PreferenceModel(name: 'yoga',isSelected: false));
    userInterests.add(PreferenceModel(name: 'outdoor',isSelected: false));
    userInterests.add(PreferenceModel(name: 'climbing',isSelected: false));
    userInterests.add(PreferenceModel(name: 'cycling',isSelected: false));
    userInterests.add(PreferenceModel(name: 'running',isSelected: false));
    userInterests.add(PreferenceModel(name: 'hiking',isSelected: false));
    userInterests.add(PreferenceModel(name: 'golf',isSelected: false));
    userInterests.add(PreferenceModel(name: 'photography',isSelected: false));
  }

  void addMessages()
  {
    messages.add(ChatDetailsModel(message: "Lorem ipsum dolor sit amet, consect adip iscing elit, sed do eiusmod. tempor…..incididunt ut labore et dolore magna aliqua",time: '2:00 am',incomingMsg: true,messageType: 0));
    messages.add(ChatDetailsModel(message: "Hey Julian",time: '2:00 am',incomingMsg: false,messageType: 0));
    notifyListeners();
  }

  void addUser(){
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active',coverPhoto: [AppDummyData.profileDummy,AppDummyData.profileDummy,AppDummyData.profileDummy],intrests:userInterests,music: userMusicTaste ,favorite: true),);
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active',coverPhoto: [AppDummyData.dummyUser2,AppDummyData.dummyUser2,AppDummyData.dummyUser2,],intrests:userInterests,music: userMusicTaste,favorite: false ));
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active',coverPhoto: [AppDummyData.dummyUser3,AppDummyData.dummyUser3,AppDummyData.dummyUser3],intrests:userInterests,music: userMusicTaste,favorite: false ));
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active',coverPhoto: [AppDummyData.dummyUser4,AppDummyData.dummyUser4,AppDummyData.dummyUser4],intrests:userInterests,music: userMusicTaste,favorite: false ));
    users.add(UserModel(name: 'jelensen',distance: 9,imagePath: AppImages.profile,age: 21,isVerified: true,activeStatus: 'Recently Active',coverPhoto: [AppDummyData.dummyUser5,AppDummyData.dummyUser5,AppDummyData.dummyUser5],intrests:userInterests,music: userMusicTaste,favorite: false ));

  }


  void addTickets(){
    tickets.add(TicketModel(location: "342, Block D, Wapda Town",date: "21-12-21",time: "14-30",distance:325,id:12345678,cost: 231 ));
    tickets.add(TicketModel(location: "342, Block D, Wapda Town",date: "21-12-21",time: "14-30",distance:325,id:12345679,cost: 231 ));
    tickets.add(TicketModel(location: "342, Block D, Wapda Town",date: "21-12-21",time: "14-30",distance:325,id:123456710,cost: 231 ));
    tickets.add(TicketModel(location: "342, Block D, Wapda Town",date: "21-12-21",time: "14-30",distance:325,id:123456711,cost: 231 ));

  }


  void addChats(){
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Julian Dasilva', lastMessage: AppDummyData.shortText,time: 'now',isFavourite: false));
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Mike Lyne', lastMessage: AppDummyData.shortText,time:"3 min ago",isFavourite: true));
    personalChats.add(PersonalChatModel(imagePath: AppImages.notification1, name: 'Jane Doe', lastMessage: AppDummyData.shortText,time:" yesterday",isFavourite: false));
  }
  void addGroupChat()
  {
    groupChats.add(GroupChatModel(chatName: 'Birthday party', people: names, lastMessage: AppDummyData.shortText, date: '10/7/2017', lastMessageSender: names.first));
    groupChats.add(GroupChatModel(chatName: 'AmericanParty', people: names, lastMessage: AppDummyData.shortText, date: '10/7/2017', lastMessageSender: names.first));

  }
  void addFilters(){
    filters.musicTaste.add(PreferenceModel(name:'pop' ,isSelected: false));
    filters.musicTaste.add(PreferenceModel(name:'rock' ,isSelected: false));
    filters.musicTaste.add(PreferenceModel(name:'jazz' ,isSelected: false));
    filters.musicTaste.add(PreferenceModel(name:'soul' ,isSelected: false));
    filters.musicTaste.add(PreferenceModel(name:'funk' ,isSelected: false));
    //
    filters.eventTypes.add(PreferenceModel(name:"private_events",isSelected: false));
    filters.eventTypes.add(PreferenceModel(name:"communication_events",isSelected: false));
    filters.eventTypes.add(PreferenceModel(name:"activites",isSelected: false));
    //
    filters.friend.add(PreferenceModel(name:"all",isSelected: false));
    filters.friend.add(PreferenceModel(name:"favourites",isSelected: false));
    filters.friend.add(PreferenceModel(name:"contact_list",isSelected: false));
    filters.friend.add(PreferenceModel(name:"squard",isSelected: false));
    //
    filters.timeDuration.add(PreferenceModel(name:"now",isSelected: false));
    filters.timeDuration.add(PreferenceModel(name:"today",isSelected: false));
    filters.timeDuration.add(PreferenceModel(name:"tomorrow",isSelected: false));
    filters.timeDuration.add(PreferenceModel(name:"week",isSelected: false));





  }
  void update(){
    notifyListeners();
  }
}