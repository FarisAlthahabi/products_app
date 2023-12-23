import 'package:dio/dio.dart';
import 'package:phones_app/Model/AddProduct_model.dart';
import 'package:phones_app/Model/Products_model.dart';
import 'package:phones_app/Service/base_service.dart';

abstract class PhonesService extends BaseUrl {
  Future<List<PhonesModel>> getAllPhones();
  AddPhone(
      int id, String title, String description, String brand, double price);
  getSinglePhone(int id);
}

class PhonesServiceImp extends PhonesService {
  @override
  Future<List<PhonesModel>> getAllPhones() async {
    Response response = await dio.get(getPhonesUrl);
    if (response.statusCode == 200) {
      dynamic temp = response.data['products'];
      List<PhonesModel> Phones = List.generate(
          temp.length, (index) => PhonesModel.fromMap(temp[index]));
      print(Phones);
      return Phones;
    } else
      return [];
  }

  @override
  AddPhone(int id, String title, String description, String brand,
      double price) async {
    AddPhoneModel request = AddPhoneModel(
      id: id,
      title: title,
      description: description,
      brand: brand,
      price: price,
    );
    Response response = await dio.post(addPhoneUrl, data: request.toJson());
    if (response.statusCode == 200) {
      print('New Phone is Added Successfully');
    } else {
      return 'Error';
    }
  }

  @override
  getSinglePhone(int id) async {
    Response response = await dio.get('${getPhonesUrl}/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else
      return 'error';
  }
}
