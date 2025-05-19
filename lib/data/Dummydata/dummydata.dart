
import 'package:mystore/features/shop/models/banner_model.dart';
import 'package:mystore/features/shop/models/category_model.dart';
import 'package:mystore/utils/routes/routes.dart';

import '../../utils/constants/image_strings.dart';

class TDummyData{
  static final List<BannerModel> banners=[
    BannerModel( imageUrl: TImages.banner1, targetScrren:TRoutes.store,active: true),
  ];
  static final List<CategoryModel> categories=[
      CategoryModel(id: '1', name: "sports", image: TImages.sportIcon, isFeatured: true),
      CategoryModel(id: '2', name: "Furniture", image: TImages.furnitureIcon, isFeatured: true),
      CategoryModel(id: '3', name: "Electronics", image: TImages.electronicsIcon, isFeatured: true),
      CategoryModel(id: '4', name: "Clothes", image: TImages.clothIcon, isFeatured: true),
      CategoryModel(id: '5', name: "Animals", image: TImages.animalIcon, isFeatured: true),
      CategoryModel(id: '6', name: "Cosmetics", image: TImages.cosmeticsIcon, isFeatured: true),
      CategoryModel(id: '7', name: "Jewelery", image: TImages.jeweleryIcon, isFeatured: true),
      CategoryModel(id: '8', name: "Toys", image: TImages.toyIcon, isFeatured: true),
      // CategoryModel(id: '9', name: "Laptop", image: TImages.l, isFeatured: true),
      // CategoryModel(id: '10', name: "Mobile", image: TImages.sportIcon, isFeatured: true),


  ];
}