import 'package:amigos/models/PreferenceModel.dart';

class UserModel{
   String? name;
   int? age;
   int? distance;
   String? imagePath;
   bool isVerified;
   String activeStatus;
   String? coverPhoto;
   List<PreferenceModel>? intrests=[];
   List<PreferenceModel>? music;

   UserModel({this.name, this.age, this.distance, this.imagePath,required this.isVerified,required this.activeStatus,this.coverPhoto,this.intrests,this.music});
}