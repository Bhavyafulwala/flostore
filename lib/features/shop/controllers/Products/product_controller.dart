
import 'package:get/get.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    //
    fetchFeaturedProducts();

    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading(true);
      final products = await productRepository.getfeaturedproducts();
      print("Fetched products: ${products.length}");

      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getfeaturedproducts();
      print("Fetched products: ${products.length}");
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return[];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      final priceToShow = product.salePrice > 0 ? product.salePrice : product.price;
      return '\$${priceToShow.toStringAsFixed(2)}';
    } else if (product.productVariations != null && product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;
        if (priceToConsider < smallestPrice) smallestPrice = priceToConsider;
        if (priceToConsider > largestPrice) largestPrice = priceToConsider;
      }

      if (smallestPrice == largestPrice) {
        return '\$${smallestPrice.toStringAsFixed(2)}';
      } else {
        return '\$${smallestPrice.toStringAsFixed(2)} - \$${largestPrice.toStringAsFixed(2)}';
      }
    } else {
      // No variations found, fallback to base price
      return '\$${product.price.toStringAsFixed(2)}';
    }
  }



  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}