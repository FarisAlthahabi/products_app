// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhonesModel {
  int id;
  String title;
  String description;
  String brand;
  double price;
  String thumbnail;
  PhonesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
    required this.thumbnail,
  });

  PhonesModel copyWith({
    int? id,
    String? title,
    String? description,
    String? brand,
    double? price,
    String? thumbnail,
  }) {
    return PhonesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'brand': brand,
      'price': price,
      'thumbnail': thumbnail,
    };
  }

  factory PhonesModel.fromMap(Map<String, dynamic> map) {
    return PhonesModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      brand: map['brand'] as String,
      price: map['price'] as double,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhonesModel.fromJson(String source) =>
      PhonesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhonesModel(id: $id, title: $title, description: $description, brand: $brand, price: $price, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant PhonesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.brand == brand &&
      other.price == price &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      brand.hashCode ^
      price.hashCode ^
      thumbnail.hashCode;
  }
}
