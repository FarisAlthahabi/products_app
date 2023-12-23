// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddPhoneModel {
  int id;
  String title;
  String description;
  String brand;
  double price;
  AddPhoneModel({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
  });

  AddPhoneModel copyWith({
    int? id,
    String? title,
    String? description,
    String? brand,
    double? price,
  }) {
    return AddPhoneModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'brand': brand,
      'price': price,
    };
  }

  factory AddPhoneModel.fromMap(Map<String, dynamic> map) {
    return AddPhoneModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      brand: map['brand'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPhoneModel.fromJson(String source) => AddPhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddPhoneModel(id: $id, title: $title, description: $description, brand: $brand, price: $price)';
  }

  @override
  bool operator ==(covariant AddPhoneModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.brand == brand &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      brand.hashCode ^
      price.hashCode;
  }
  }
