
class Product {
  int? id;
  String? name;
  String? description;
  double? unitPrice;

  Product({required this.id,required this.name,required this.description,required this.unitPrice});
  Product.withId({required this.id,required this.name,required this.description,required this.unitPrice});
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
  Product.fromMap(Map<String, dynamic?> map) {
    id = int.parse(map["id"].toString());
    name = map["name"];
    description =map["description"];
    unitPrice=double.parse(map["unitPrice"].toString());
  }
}



