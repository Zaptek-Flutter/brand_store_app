class ShirtModel {
  final String name;
  final List<String>? colors;
  final List<String>? sizes;
  final String? thumbnail;
  final String image;
  final double price;
  final String category;
  final bool? networkImage;

  ShirtModel({
    required this.name,
    this.colors,
    this.thumbnail,
    this.sizes,
    this.networkImage,
    required this.image,
    required this.price,
    required this.category,
  });
}
