// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

String allDataToJson(AllData data) => json.encode(data.toJson());

class AllData {
  List<Message> message;

  AllData({
    required this.message,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  String itemGroup;
  List<Item> items;

  Message({
    required this.itemGroup,
    required this.items,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        itemGroup: json["item_group"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item_group": itemGroup,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String name;
  double valuationRate;
  String? image;
  var stock_qty;

  Item({
    required this.name,
    required this.valuationRate,
    this.image,
    this.stock_qty,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        valuationRate: json["valuation_rate"].toDouble(),
        image: json["image"],
        stock_qty: json["stock_qty"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "valuation_rate": valuationRate,
        "image": image,
        "stock_qty": stock_qty,
      };
}
