import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel{
  String imageUrl;
  final String targetScrren;
  final bool active;

  BannerModel({required this.imageUrl,required this.targetScrren, required this.active});


  Map<String,dynamic> tojson(){
    return {
      'ImageUrl':imageUrl,
      'TargetScreen':targetScrren,
      'Active':active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot){
    final data=snapshot.data() as Map<String,dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl']??'',
      targetScrren: data['TargetScreen']??'',
      active: data['Active']??false,
    );
  }
}