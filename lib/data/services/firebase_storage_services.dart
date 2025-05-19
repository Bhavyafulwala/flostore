import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mystore/features/shop/models/category_model.dart';

class TFirebaseStorageServices extends GetxController{
  static TFirebaseStorageServices get instance=>Get.find();

  final _firebaseStorage=FirebaseStorage.instance;

  Future<Uint8List> getImageDatafromAssets(String path)async{
    try{
      final byteData=await rootBundle.load(path);
      final imageData=byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
      return imageData;
    } catch(e){
      throw "Error loading image:$e";

    }
  }
  Future<String> uploadImageData(String path,Uint8List image,String name)async{
    try{
      final ref=_firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url=await ref.getDownloadURL();
      return url;
    }catch(e){
      if(e is FirebaseException){
        throw "Firebase Exception:${e.message}";
      }else if(e is SocketException){
        throw "No Internet Connection";
      }else{
        throw "Something went wrong";
      }
    }
  }
  Future<String> uploadImageFile(String path,XFile image)async{
    try{
      final ref=_firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url=await ref.getDownloadURL();
      return url;
    }catch (e){
      if(e is FirebaseException){
        throw "Firebase Exception:${e.message}";
      }else if(e is SocketException){
        throw "No Internet Connection";
      }else{
        throw "Something went wrong";
      }

    }
  }



}