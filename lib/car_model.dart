class Car {
  String name;
  String imgSrc;
  String details;
  bool isFavorite;

  Car({
    required this.name,
    required this.imgSrc,
    required this.details,
    this.isFavorite = false,
  });
}
