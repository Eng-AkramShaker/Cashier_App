// ignore_for_file: unused_field, sized_box_for_whitespace, unused_local_variable, avoid_print, non_constant_identifier_names

import 'package:cashier/core/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cashier/models/itemes_model.dart';
import 'package:cashier/controllers/categories_provider/categories.dart';
import 'package:cashier/core/constants/constants.dart';
import 'package:cashier/widgets/cards/profile_card.dart';
import 'package:cashier/Screens/total_screen/total_screen.dart';

import '../../../controllers/invoice_provider/invoice.dart';
import '../../../core/constants/custom_back_ground.dart';
import '../../../models/all_data.dart';
import '../../../widgets/texts/custom_text.dart';
import '../widgets/category_button.dart';
import '../widgets/menu_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<AllData>? _futureData;

  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() async {
    _futureData = Api().fetchData(context);

    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    setState(() {
      provCategory.Category = items_1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
        return Custom_Back_Ground(
          widget: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 8.h,
                      width: 11.w,
                      child: Image.asset("assets/images/logo.png", fit: BoxFit.fitWidth),
                    ),
                    const ProfileCard(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        color: w_bluColor,
                        child: const Total_Screen(),
                      ),
                    ),

                    // =====================================================================================

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.1.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Custom_Text(text: 'Category', size: 15.sp, color: wtColor),
                            SizedBox(height: 2.h),

                            // ============================================================================

                            Column(
                              children: [
                                Container(
                                  height: size.height / 1.3,
                                  width: size.width,
                                  // color: Colors.green,
                                  child: Center(
                                    child: FutureBuilder<AllData>(
                                      future: _futureData,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const CircularProgressIndicator(color: secondaryColor);
                                        } else if (snapshot.hasError) {
                                          return Text('Error: ${snapshot.error}');
                                        } else if (snapshot.hasData) {
                                          final allData = snapshot.data!;
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 100,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: allData.message.length,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: CategoryButton(
                                                        title: provCategory.model_group[index].toString(),
                                                        icon: Icons.whatshot,
                                                        isSelected: provCategory.selectedCategory == index,
                                                        onTap: () {
                                                          setState(() {
                                                            provCategory.selectedCategory = index;
                                                          });
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Menu_Products(context, provCategory),
                                            ],
                                          );
                                        } else {
                                          return const Text('No data available');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
