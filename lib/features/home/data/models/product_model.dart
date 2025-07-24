class ProductModel {
  final String id ;
  final String name ;
  final String image ;
  final num price ;
  ProductModel({required this.id ,required this.name, required this.image, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
  Map<String , dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };

  }
  
}