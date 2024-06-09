// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/categories_provider/categories.dart';
import '../../../widgets/cards/costume_card.dart';
import '../../../widgets/show_snack/select_menu.dart';
import 'menu.dart';

Menu_Products(context, Categories_Provider provCategory) {
  return Consumer<Categories_Provider>(builder: (context, provCategory, child) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 2.h,
        ),
        itemCount: provCategory.model_items[provCategory.selectedCategory].length,
        itemBuilder: (context, index) {
          final img = provCategory.model_items[provCategory.selectedCategory][index].image.toString();
          String name = provCategory.model_items[provCategory.selectedCategory][index].name.toString();
          double price = double.parse(provCategory.model_items[provCategory.selectedCategory][index].valuationRate.toString());
          String stock_qty = provCategory.model_items[provCategory.selectedCategory][index].stock_qty.toString();

          return Column(
            children: [
              InkWell(
                onTap: () {
                  Snack_Select_Menu(
                    context: context,
                    widget: widget_Menu(
                      img: 'https://saudi-innovation.com$img',
                      price: price,
                    ),
                    onPressed: () async {
                      //
                      for (var i = 0; i < provCategory.T_F_list.length; i++) {
                        if (provCategory.T_F_list[i] != '') {
                          provCategory.details += ' ${provCategory.T_F_list[i]} ';
                        }
                      }

                      // setState(() {
                      if (provCategory.number > 1 && price == provCategory.Menu_total) {
                        provCategory.Menu_total *= provCategory.number;
                      } else if (provCategory.number == 1 && price != provCategory.Menu_total) {
                        price *= provCategory.number;
                      } else {
                        provCategory.Menu_total *= provCategory.number;
                      }
                      // });

                      provCategory.addCategory({
                        "title": name,
                        "price": provCategory.Menu_total == 0 ? price : provCategory.Menu_total,
                        "number": provCategory.number,
                        "details": provCategory.details,
                      });

                      // setState(() {
                      provCategory.T_F_list = ['', '', ''];
                      provCategory.details = '';
                      provCategory.number = 1;
                      provCategory.Menu_total = 0;
                      // });

                      provCategory.cal_Total();

                      Navigator.of(context).pop();
                    },
                  );
                },
                child: Costume_card(
                  img: 'https://saudi-innovation.com$img',
                  title: name,
                  price: price.toString(),
                  stock_qty: stock_qty,
                ),
              ),
            ],
          );
        },
      ),
    );
  });
}


//  img != null || img != 'null' ? img : 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',