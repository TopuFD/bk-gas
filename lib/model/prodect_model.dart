class ProductModel {
  ProductModel({
    required this.image,
    required this.price,
    required this.rating,
    required this.weight,
    required this.title,
    required this.subtitle,
  });
  late final String image;
  late final int price;
  late final int rating;
  late final int weight;
  late final String title;
  late final String subtitle;
  
  ProductModel.fromJson(Map<String, dynamic> json){
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    weight = json['weight'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['price'] = price;
    data['rating'] = rating;
    data['weight'] = weight;
    data['title'] = title;
    data['subtitle'] = subtitle;
    return data;
  }
}