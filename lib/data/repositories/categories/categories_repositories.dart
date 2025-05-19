
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../services/firebase_storage_services.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async{
    try{
      final snapshot=await _db.collection('Categories').get();
      final list=snapshot.docs.map((document)=>CategoryModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";
    }
  }
  Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
      final storagecont=Get.put(TFirebaseStorageServices());

      for(var category in categories){
        final file=await storagecont.getImageDatafromAssets(category.image);

        final url=await storagecont.uploadImageData("Categories", file, category.name);

        category.image=url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
    throw const TFormatException();
    }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
    } catch(e){
    throw"Something went wrong,please try again";

    }

  }


}