import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notion_task/model/getcartmodel.dart';
import 'package:notion_task/model/getmodel.dart';

class GetAPI {
  Future<GetProduct?> getproducts() async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://mumbaimillionaires.in/mmApi/api/show/menu-list?customer_id=1&hotel_id=2'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return GetProduct.fromJson(json.decode(responsedata.body));
    } else {
      return null;
    }
  }

  Future<Cart?> getcartproducts() async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://mumbaimillionaires.in/mmApi/api/show/cart?customer_id=3'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return Cart.fromJson(json.decode(responsedata.body));
    } else {
      return null;
    }
  }
}
