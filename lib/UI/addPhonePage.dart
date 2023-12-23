import 'package:flutter/material.dart';
import 'package:phones_app/Service/Phones_service.dart';
import 'package:phones_app/main.dart';

bool value = true;
TextEditingController BrandController = TextEditingController();
TextEditingController IdController = TextEditingController();
TextEditingController TitleController = TextEditingController();
TextEditingController DescriptionController = TextEditingController();
TextEditingController PriceController = TextEditingController();

class AddPhonePage extends StatefulWidget {
  const AddPhonePage({super.key});

  @override
  State<AddPhonePage> createState() => _AddPhonePageState();
}

class _AddPhonePageState extends State<AddPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(151, 117, 250, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 160),
          child: Text('Phone',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(29, 30, 32, 1),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter')),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 400),
            child: Text('Brand',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(29, 30, 32, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1)),
              child: TextField(
                controller: BrandController,
                decoration: InputDecoration(
                    hintText: '   Samsung', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text('Id',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(29, 30, 32, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 230),
                    child: Text('title',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(29, 30, 32, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter')),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(245, 246, 250, 1)),
                  child: TextField(
                    controller: IdController,
                    decoration: InputDecoration(
                        hintText: '   20', border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(245, 246, 250, 1)),
                  child: TextField(
                    controller: TitleController,
                    decoration: InputDecoration(
                        hintText: '   Samsung note 5 pro',
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 350),
            child: Text('description',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(29, 30, 32, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1)),
              child: TextField(
                controller: DescriptionController,
                decoration: InputDecoration(
                    hintText:
                        '   high performance .. wide screen .. big storage..',
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 400, top: 10),
            child: Text('price',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(29, 30, 32, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1)),
              child: TextField(
                controller: PriceController,
                decoration: InputDecoration(
                    hintText: '   40000000', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text('Save as primary phone',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(29, 30, 32, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 230,
                    ),
                    child: Switch(
                        value: value,
                        onChanged: (bool ValueKey) {
                          setState(() {
                            value = ValueKey;
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 70),
              child: InkWell(
                onTap: () {
                  PhonesServiceImp().AddPhone(
                      int.parse(IdController.text),
                      TitleController.text,
                      DescriptionController.text,
                      BrandController.text,
                      double.parse(PriceController.text));
                },
                child: Container(
                    child: Center(
                        child: Text('Add Phone',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter'))),
                    width: 333,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(151, 117, 250, 1),
                      borderRadius: BorderRadius.circular(40),
                    )),
              )),
        ],
      ),
    );
  }
}
