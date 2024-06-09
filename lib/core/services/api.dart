// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:provider/provider.dart';

import '../../controllers/categories_provider/categories.dart';
import '../../models/all_data.dart';
import '../../models/login_model.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import '../constants/config.dart';

class Api {
  // Api_Login =======================================================================================

  Future Api_Login(context, String email, String pass) async {
    try {
      if (email.isEmpty || pass.isEmpty) {
        Snak_Bar(context, "يرجى تعبئة جميع الحقول");
        return;
      }

      var headers = {
        'Cookie':
            'full_name=Administrator; sid=882f7ebbfefd39eee2cafb83c337937cc56d32ab0178e94c450c7cc3; system_user=yes; user_id=Administrator; user_image='
      };
      var request = http.Request('POST', Uri.parse('${Config.baseUrl + Config.login}?usr=$email&pwd=$pass'));

      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201 || response.statusCode == 200) {
        http.Response res = await http.Response.fromStream(response);
        Map<String, dynamic> jsonResponse = jsonDecode(res.body);

        User user = User.fromJson(jsonResponse);

        print(user.message);

        Snak_Bar(context, '${user.fullName}  :تم تسجيل الدخول بنجاح');

        return user.message;
      } else {
        Snak_Bar(context, "فشل تسجيل الدخول");
        print('Failed to login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      Snak_Bar(context, "حدث خطأ أثناء تسجيل الدخول");
    }
  }

  //  =======================================================================================
  Future<AllData> fetchData(context) async {
    final prov_Category = Provider.of<Categories_Provider>(context, listen: false);

    String apiUrl = Config.baseUrl + Config.product;

    final headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=61e448a2cbe52db385a5051101b2a9a91a11a31f8f528f53c7d85c93; system_user=yes; user_id=Administrator; user_image='
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final allData = allDataFromJson(response.body);
      print(allData.message[1].itemGroup);
      print(allData.message[1].items.length);

      prov_Category.model_group = [];
      prov_Category.model_items = [];

      for (var i = 0; i < allData.message.length; i++) {
        prov_Category.model_group.add(allData.message[i].itemGroup);

        prov_Category.model_items.add(allData.message[i].items);
      }

      return allData;
    } else {
      throw Exception('Failed to load data');
    }

    // final response = await http.get(Uri.parse(apiUrl), headers: headers);

    // if (response.statusCode == 200) {
    //   // print(response.body);
    //   // print(AllData.fromJson(jsonDecode(response.body)).message[0].itemGroup);

    //   // print(AllData.fromJson(jsonDecode(response.body)).message[0].items[0].name);

    //   prov_Category.New_Categories = [];
    //   prov_Category.New_items = [];

    //   var data = AllData.fromJson(jsonDecode(response.body)).message;

    //   List<Map> all = [];
    //   all = [];

    //   for (var i = 0; i < AllData.fromJson(jsonDecode(response.body)).message.length; i++) {
    //     // prov_Category.New_Categories.add(data[i].itemGroup);
    //     // prov_Category.New_items.add(data[i].items);
    //     all.add(
    //       {
    //         'category': data[i].itemGroup,
    //         'items': data[i].items,
    //       },
    //     );
    //   }

    //   print(all[1]['category']);
    //   print(all[1]['items'][0].name);

    //   // print(prov_Category.New_Categories[1]);
    //   // print(prov_Category.New_items[1].length);

    //   // print(prov_Category.New_items[1][0].name);

    //   return AllData.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }

//
}
