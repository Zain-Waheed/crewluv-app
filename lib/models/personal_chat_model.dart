class PersonalChatModel{
  String imagePath;
  String name;
  String lastMessage;
  String time;
  bool seen=false;
  bool? isFavourite=false;
  PersonalChatModel({required this.imagePath, required this.name, required this.lastMessage,required this.time,this.isFavourite});
}