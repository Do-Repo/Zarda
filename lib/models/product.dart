class Product {
  String imageUrl;
  String name;
  String description;
  double price;
  String measure;
  List<String> ingredients;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.measure,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
        "description": description,
        "price": price,
        "measure": measure,
        "ingredients": ingredients
      };

  Product.fromJson(Map<String, dynamic> parsedJSON)
      : imageUrl = parsedJSON['imageUrl'],
        name = parsedJSON['name'],
        description = parsedJSON['description'],
        price = parsedJSON['price'],
        measure = parsedJSON['measure'],
        ingredients = parsedJSON['ingredients'];
}
