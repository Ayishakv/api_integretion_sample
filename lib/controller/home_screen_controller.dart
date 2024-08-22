import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  String? fact;
  String? message;

  bool isLoading = false;
  //https://catfact.ninja/fact
//https://dog.ceo/api/breeds/image/random
  Future<void> getuserdata() async {
    isLoading = true;
    notifyListeners();
    //to configure the url
    final url = Uri.parse("https://dog.ceo/api/breeds/image/random");
    var responsedata = await http.get(url);
    print(responsedata.statusCode);
    print(responsedata.body);
    if (responsedata.statusCode == 200) {
      var decodedata = jsonDecode(responsedata.body);
      // fact = decodedata["fact"];
      message = decodedata["message"];
      isLoading = false;
      // print(decodedata["fact"]);
      print(decodedata["message"]);
    }
    notifyListeners();
  }
}
