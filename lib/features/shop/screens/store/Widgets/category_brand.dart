import 'package:flutter/cupertino.dart';
import 'package:mystore/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return const TBrandShowcase(images: [TImages.productImage1,TImages.productImage2,TImages.productImage3],);
  }
}
