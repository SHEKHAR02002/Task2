import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notion_task/api/getapi.dart';
import 'package:notion_task/model/getmodel.dart';
import 'package:notion_task/screen/cartlist_screen.dart';
import 'package:notion_task/screen/customwidget/productcard.dart';
import 'package:notion_task/theme.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //require datatype
  GetProduct? productsdata;
  bool loader = true;

  //call the api function
  void callAPI() async {
    productsdata = await GetAPI().getproducts();
    setState(() {
      loader = false;
    });
  }

  // initially call the get api
  @override
  void initState() {
    callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "PRODUCTS",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: primary),
          ),
          actions: [
            InkWell(
              //navigate to add to cart list
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen())),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 12),
                child: Icon(
                  CupertinoIcons.cart,
                  color: primary,
                  size: 24,
                ),
              ),
            ),
          ]),
      body: loader
          ? const CircularProgressIndicator()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: productsdata!.data!.length,
              itemBuilder: (context, index) {
                var products = productsdata!.data![index];
                // Call Product Cart Custom Widget
                return ProductCard(
                  products: products,
                );
              }),
    );
  }
}
