class UserModel{
   String? name;
   int? age;
   int? distance;
   String? imagePath;
   bool isVerified;
   String activeStatus;
   UserModel({this.name, this.age, this.distance, this.imagePath,required this.isVerified,required this.activeStatus});
}