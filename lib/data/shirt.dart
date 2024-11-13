import 'package:brand_store_app/models/shirt_model.dart';

class Shirt {
  static List<ShirtModel> shirts = [
    ShirtModel(
        name: "Premium Tangerine Shirt",
        colors: ["Red", "Blue", "Green"],
        sizes: ["S", "M", "L", "XL", "XXL"],
        image: "assets/images/shirts/tagerine_shirt.png",
        price: 258.75),
    ShirtModel(
        name: "Navy Tangerine Shirt",
        colors: ["Red", "Blue", "Green"],
        sizes: ["S", "M", "L", "XL", "XXL"],
        image: "assets/images/shirts/tagerine_shirt2.png",
        price: 307.55),
    ShirtModel(
        name: "Tangerine Coat",
        colors: ["Red", "Blue", "Green"],
        sizes: ["S", "M", "L", "XL", "XXL"],
        image: "assets/images/shirts/tagerine_coat.png",
        price: 380.55),
    ShirtModel(
        name: "Leather Coat",
        colors: ["Red", "Blue", "Green"],
        sizes: ["S", "M", "L", "XL", "XXL"],
        image: "assets/images/shirts/leather_coat.png",
        price: 258.75),
  ];
}
