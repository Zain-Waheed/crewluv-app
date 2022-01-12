import 'dart:io';

class ChatDetailsModel{
  String? message;
  File? file;
  String? time;
  bool? incomingMsg;
  int messageType;
  ChatDetailsModel({this.message,this.time,this.incomingMsg,this.file,required this.messageType});
}