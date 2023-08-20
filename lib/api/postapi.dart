import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddProduct {
  Future addtocart(
      {required menuid,
      required userid,
      required quantity,
      required patenerid,
      required size,
      required amount}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://mumbaimillionaires.in/mmApi/api/add/cart'));

    request.fields.addAll({
      'menu_id': menuid.toString(),
      'customer_id': "3",
      'partner_id': patenerid.toString(),
      'quantity': quantity.toString(),
      'size': size,
      'amount': amount.toString()
    });

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var msg = jsonDecode(responsedata.body)['message'];
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
      return jsonDecode(responsedata.body);
    } else {
      print(responsedata.body);
      return jsonDecode("Data2${responsedata.body}");
    }
  }


   Future quntityupdate(
      {required cartid,
      required status,
     }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://mumbaimillionaires.in/mmApi/api/add-remove/quantity/cart'));

    request.fields.addAll({
      'cart_id': cartid.toString(),
      'status': status,

    });

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var msg = jsonDecode(responsedata.body)['message'];
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
      return jsonDecode(responsedata.body);
    } else {
      print(responsedata.body);
      return jsonDecode("Data2${responsedata.body}");
    }
  }
}
