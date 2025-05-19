
import 'package:get/get.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/models/ProductVariationModel.dart';

class VariationController extends GetxController{
  static VariationController get instance=>Get.find();

  RxMap selectedAttributes={}.obs;
  RxString variationStockStatus=''.obs;
  Rx<ProductVariationModel> selectedVariation=ProductVariationModel.empty().obs;

  void onAttributeSelected(ProductModel product, String attributeName, String attributeValue) {
    // Update selected attributes
    selectedAttributes[attributeName] = attributeValue;

    // Match selected attributes with product variations
    final matchedVariation = product.productVariations?.firstWhere(
          (variation) => isSameAttributeValues(
        variation.attributeValues,
        Map<String, dynamic>.from(selectedAttributes),
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    // Update selected variation and stock status
    selectedVariation.value = matchedVariation!;
    getProductVariationStockStatus();
  }
  bool isSameAttributeValues(Map<String,dynamic> variationAttributes,Map<String,dynamic> selectedAttributes){
    //If selectedattributes contains 3 attributes and 2values then return
    if(selectedAttributes.length!=variationAttributes.length){
      return false;
    }
    //If any of the attribute is different then return eg [Green.large]x[Green,small]
    for(final key in selectedAttributes.keys){
      if(variationAttributes[key]!=selectedAttributes[key])return false;
    }
    return true;
  }
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations,String attributeName){
    //Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues=variations.where(
      //check empty/out of stock
            (variation)=>variation.attributeValues[attributeName]!=null&&variation.attributeValues[attributeName]!.isNotEmpty&&variation.stock>0)
    //fetch all non empty attribute of variations
        .map((variation)=>variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
    
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice>0?selectedVariation.value.salePrice:selectedVariation.value.price).toString();
  }



  void getProductVariationStockStatus(){
    variationStockStatus.value=selectedVariation.value.stock>0?'In Stock':'Out of Stock';
  }
  void resetSelectedAttributes(){
    selectedAttributes.clear();
    selectedVariation.value=ProductVariationModel.empty();
    variationStockStatus.value='';

  }
}