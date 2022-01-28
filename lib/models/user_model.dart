import 'package:amigos/models/PreferenceModel.dart';

class UserModel{
   String? name;
   int? age;
   int? distance;
   String? imagePath;
   bool isVerified;
   String activeStatus;
   List<String>? coverPhoto;
   List<PreferenceModel>? intrests=[];
   List<PreferenceModel>? music;
   bool? favorite;
   bool? BarImage;

   UserModel({this.name, this.age, this.distance, this.imagePath,required this.isVerified,required this.activeStatus,this.coverPhoto,this.intrests,this.music,this.favorite,this.BarImage});
}