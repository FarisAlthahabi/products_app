import 'package:flutter/material.dart';
import 'package:phones_app/Model/Products_model.dart';
import 'package:phones_app/Service/Phones_service.dart';
import 'package:phones_app/UI/ShowDetails.dart';
import 'package:phones_app/UI/addPhonePage.dart';
import 'package:phones_app/main.dart';

class homePage extends StatelessWidget {
  homePage({super.key});

  late int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.menu),
              backgroundColor: Color.fromRGBO(245, 246, 250, 1),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(Icons.shopping_bag_outlined),
                backgroundColor: Color.fromRGBO(245, 246, 250, 1),
              ),
            )
          ],
        ),
        body: FutureBuilder(
            future: PhonesServiceImp().getAllPhones(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                dynamic temp = snapshot.data;
                List<PhonesModel> Phones = temp as List<PhonesModel>;
                List<PhonesModel> search_result = [];
                print(temp);
                print(search_result);

                if (temp.isEmpty)
                  return Center(child: Text('Empty'));
                else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 385),
                        child: Text('Hello',
                            style: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(29, 30, 32, 1),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 330),
                        child: Text('Welcome to Laza.',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(143, 149, 158, 1),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 246, 250, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Icon(Icons.search),
                                      Container(
                                        width: 350,
                                        child: StatefulBuilder(
                                          builder: (context, setState) =>
                                              TextField(
                                            onChanged: (value) {
                                              print(value);
                                              setState(() {
                                                search_result.clear();
                                                Phones.forEach((element) {
                                                  if (element.title
                                                      .contains(value)) {
                                                    search_result.add(element);
                                                  }
                                                });
                                              });
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Search...',
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(151, 117, 250, 1),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.keyboard_voice),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Choose Brand',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Text('View All',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(143, 149, 158, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 500,
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: 500,
                              height: 70,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Phones.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 155,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                245, 246, 250, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  child: Image.network(
                                                      Phones[index].thumbnail),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          254, 254, 254, 1),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Text(
                                                    '${Phones[index].brand}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromRGBO(
                                                            29, 30, 32, 1),
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Inter')),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            )),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('New Arraival',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Text('View All',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(143, 149, 158, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 260,
                          child: GridView.builder(
                              itemCount: search_result.length,
                              //itemCount: Phones.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 165,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShowDetailsPage(
                                                              id: search_result[
                                                                      index]
                                                                  .id,
                                                              // id: Phones[index]
                                                              //     .id,
                                                            )));
                                              },
                                              child: Image.network(
                                                  search_result[index].thumbnail
                                                  // Phones[index].thumbnail
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 190, top: 10),
                                            child: Icon(Icons.favorite_border),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text(search_result[index].title,
                                            // Phones[index].title,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    29, 30, 32, 1),
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Inter')),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text(search_result[index].brand,
                                            //   Phones[index].brand,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    29, 30, 32, 1),
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Inter')),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text(
                                            '${search_result[index].price}',
                                            // '${Phones[index].price}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    29, 30, 32, 1),
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Inter')),
                                      ),
                                    ],
                                  )),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) => NavigationBar(
                            height: 80,
                            selectedIndex: currentPageIndex,
                            onDestinationSelected: (int index) {
                              setState(() {
                                currentPageIndex = index;
                                print(index);
                                if (index == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddPhonePage(),
                                      ));
                                }
                              });
                            },
                            destinations: [
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.home_outlined,
                                    color: Color.fromRGBO(143, 149, 158, 1),
                                  ),
                                  label: 'home'),
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(143, 149, 158, 1),
                                  ),
                                  label: 'Add'),
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color.fromRGBO(143, 149, 158, 1),
                                  ),
                                  label: 'buy'),
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color.fromRGBO(143, 149, 158, 1),
                                  ),
                                  label: 'details')
                            ]),
                      ),
                    ],
                  );
                }
              } else {
                print(snapshot.error);
                return LinearProgressIndicator();
              }
            }));
  }
}
