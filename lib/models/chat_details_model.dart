import 'dart:io';

import 'package:file_picker/file_picker.dart';

class ChatDetailsModel{
  String? message;
  String? file;
  String? time;
  bool? incomingMsg;
  int messageType;
  ChatDetailsModel({this.message,this.time,this.incomingMsg,this.file,required this.messageType});
}