class ProductAttributeModel {
  String? name;
  final List<String> values;

  ProductAttributeModel({
    this.name,
    this.values = const [], // default to empty list
  });

  // Fix the method name to match Dart conventions
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  // Safe fromJson that won't crash if Values is missing or null
  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data['Name'] ?? '',
      values: data['Values'] is List
          ? List<String>.from(data['Values'])
          : [], // Safe fallback
    );
  }
}
