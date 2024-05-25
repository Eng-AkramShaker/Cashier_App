// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types, unused_local_variable, unused_field, constant_identifier_names, unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cashier/model/itemes_model.dart';
import 'package:flutter/material.dart';

import '../../widets/cards/costume_card.dart';
import '../../widets/texts/custom_text.dart';
import '../../widets/cards/profile_card.dart';
import '../total_screen/total_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  List Category = [];

  @override
  void initState() {
    super.initState();

    intS();
  }

  intS() async {
    setState(() {
      Category = items_1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 150,
                      child: Image.network("https://i.imgur.com/v3dvpCE.gif", fit: BoxFit.fitWidth),
                    ),
                    ProfileCard(),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height / 1.12,
                    width: size.width / 2.27,
                    color: Colors.green,
                    child: Total_Screen(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: 'Category ', size: 25, color: Colors.white),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CategoryButton(
                              title: "Most Ordered",
                              icon: Icons.whatshot,
                              isSelected: selectedCategory == 0,
                              onTap: () {
                                setState(() {
                                  Category = items_1;
                                  selectedCategory = 0;
                                });
                              },
                            ),
                            const SizedBox(width: 25),
                            CategoryButton(
                              title: "Main Meals",
                              icon: Icons.set_meal_outlined,
                              isSelected: selectedCategory == 1,
                              onTap: () {
                                setState(() {
                                  Category = items_2;
                                  selectedCategory = 1;
                                });
                              },
                            ),
                            const SizedBox(width: 25),
                            CategoryButton(
                              title: "Sandwich",
                              icon: Icons.fastfood_outlined,
                              isSelected: selectedCategory == 2,
                              onTap: () {
                                setState(() {
                                  Category = items_3;
                                  selectedCategory = 2;
                                });
                              },
                            ),
                            const SizedBox(width: 25),
                            CategoryButton(
                              title: "Drinks",
                              icon: Icons.local_drink_outlined,
                              isSelected: selectedCategory == 3,
                              onTap: () {
                                setState(() {
                                  Category = items_4;
                                  selectedCategory = 3;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: size.height / 1.4,
                          width: size.width / 1.9,
                          // color: Colors.white,
                          padding: EdgeInsets.only(top: 30, left: 15),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // عدد الأعمدة
                              crossAxisSpacing: 12, // المسافة الأفقية بين العناصر
                              mainAxisSpacing: 0, // المسافة العمودية بين العناصر
                            ),
                            itemCount: Category.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Costume_card(
                                    img: Category[index]['img'].toString(),
                                    title: Category[index]['title'].toString(),
                                    price: Category[index]['price'].toString(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  ElevatedButton(
//                               onPressed: () {
//

//                                 setState(() {
//                                   Category = items_2;
//                                 });
//                               },
//                               child: Text('data'),
//                             ),

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.white : const Color(0xFFFBC02D),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
