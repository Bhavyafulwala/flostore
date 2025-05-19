
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/ProductModel.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<ProductModel>> getfeaturedproducts()async{
    try{
      final snapshot=await _db.collection("Products").where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e)=>ProductModel.fromSnapshot(e)).toList();
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

  Future<List<ProductModel>> getAllfeaturedproducts()async{
    try{
      final snapshot=await _db.collection("Products").where('IsFeatured',isEqualTo: true).get();
      return snapshot.docs.map((e)=>ProductModel.fromSnapshot(e)).toList();
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

  Future<List<ProductModel>> fetchProductsByQuery(Query query)async{
    try{
      final querySnapshot=await query.get();
      final List<ProductModel> productList=querySnapshot.docs.map((doc)=>ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
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
  Future<List<ProductModel>> getProductsforBrand({required String brandId,int limit=-1}) async {
    try{
      final querySnapshot=limit==-1
          ?await _db.collection("Products").where("Brand.Id",isEqualTo: brandId).get()
          :await _db.collection("Products").where("Brand.Id",isEqualTo: brandId).limit(limit).get();
      final products=querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;

    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw"Something went wrong,please try again";
    }

  }
}