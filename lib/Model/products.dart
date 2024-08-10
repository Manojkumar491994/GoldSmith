class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  bool? isImageLoading;
  Rating? rating;

  Products(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating, this.isImageLoading);
}

class Rating {
  dynamic rate;
  int? count;

  Rating(this.rate, this.count);
}
