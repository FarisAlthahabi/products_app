import 'package:flutter/material.dart';
import 'package:phones_app/Model/AddProduct_model.dart';
import 'package:phones_app/Model/Products_model.dart';
import 'package:phones_app/Service/Phones_service.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: PhonesServiceImp().getSinglePhone(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              dynamic temp = snapshot.data;
              PhonesModel Phone = PhonesModel.fromMap(temp);
              return Scaffold(
                  body: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(Phone.thumbnail),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: CircleAvatar(
                              child: Icon(Icons.arrow_back),
                              backgroundColor: Colors.white,
                            )),
                        trailing: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.shopping_bag_outlined),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Men,s Printed Pullover Hoodie',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(143, 149, 158, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter')),
                          Text('Price',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(143, 149, 158, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter')),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Nike Club Fleece',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(29, 30, 32, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter')),
                      Text('${Phone.price}',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(29, 30, 32, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Size',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(29, 30, 32, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter')),
                          Text('Size Guide',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(143, 149, 158, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter')),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                            child: Center(
                              child: Text('S',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter')),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                            child: Center(
                              child: Text('M',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter')),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                            child: Center(
                              child: Text('L',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter')),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                            child: Center(
                              child: Text('XL',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter')),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(245, 246, 250, 1),
                            ),
                            child: Center(
                              child: Text('2XL',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text('Description',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(29, 30, 32, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${Phone.description}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(143, 149, 158, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter')),
                  )
                ],
              ));
            } else {
              print(snapshot.error);
              return LinearProgressIndicator();
            }
          }),
    );
  }
}
