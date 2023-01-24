class ProductModel {
  int? id;
  String? name;
  String? price;
  String? imageLink;
  String? description;
  int? quantity;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.imageLink,
    this.description,
    this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        imageLink: json["image_link"],
        description: json["description"],
      );
}
