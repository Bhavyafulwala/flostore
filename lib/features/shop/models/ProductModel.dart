import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mystore/features/shop/models/brandModel.dart';

import 'ProductAttributeModel.dart';
import 'ProductVariationModel.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;


  ProductModel(
      {required this.id, required this.stock, this.sku, required this.price, required this.thumbnail,
        this.isFeatured, this.brand, this.description, this.categoryId,
        this.images, required this.productType, this.productAttributes,
        this.productVariations, required this.title, this.date, this.salePrice = 0.0});

  static ProductModel empty() =>
      ProductModel(id: '',
          stock: 0,
          price: 0,
          thumbnail: '',
          title: '',
          productType: '');

  tojson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'Brand': brand?.tojson(),
      'Description': description,
      'CategoryId': categoryId,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((
          e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((
          e) => e.tojson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()??{};
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      price: double.tryParse(data['Price']?.toString() ?? '0.0') ?? 0.0,
      thumbnail: data['Thumbnail'] ?? '',
      productType: data["ProductType"] ?? '',
      title: data['Title'],
      sku: data['SKU'],
      salePrice: double.tryParse(data['SalePrice']?.toString() ?? '0.0') ?? 0.0,
      isFeatured: data['IsFeatured'] ?? false,
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : BrandModel.empty(),
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List?)
          ?.map((e) => ProductAttributeModel.fromJson(e))
          .toList() ??
          [],
      productVariations: (data['ProductVariations'] as List?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document){
    final data = document.data()as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      price: double.tryParse(data['Price']?.toString() ?? '0.0') ?? 0.0,
      thumbnail: data['Thumbnail'] ?? '',
      productType: data["ProductType"] ?? '',
      title: data['Title'],
      sku: data['SKU'],
      salePrice: double.tryParse(data['SalePrice']?.toString() ?? '0.0') ?? 0.0,
      isFeatured: data['IsFeatured'] ?? false,
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : BrandModel.empty(),
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List?)
          ?.map((e) => ProductAttributeModel.fromJson(e))
          .toList() ??
          [],
      productVariations: (data['ProductVariations'] as List?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList() ??
          [],

    );
  }


}