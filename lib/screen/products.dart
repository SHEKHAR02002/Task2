import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notion_task/api/getapi.dart';
import 'package:notion_task/model/getmodel.dart';
import 'package:notion_task/screen/customwidget/productcard.dart';
import 'package:notion_task/theme.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  GetProduct? productsdata;
  bool loader = true;
  void callAPI() async {
    productsdata = await GetAPI().getproducts();
    setState(() {
      loader = false;
    });
  }

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
              onTap: () {},
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
                return ProductCard(
                  products: products,
                );
              }),
    );
  }
}
