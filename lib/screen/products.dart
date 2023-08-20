import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notion_task/api/getapi.dart';
import 'package:notion_task/model/getcartmodel.dart';
import 'package:notion_task/model/getmodel.dart';
import 'package:notion_task/screen/cartlist_screen.dart';
import 'package:notion_task/screen/customwidget/listproduct.dart';
import 'package:notion_task/theme.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //require datatype
  GetProduct? productsdata;
  Cart? cartdata;
  bool loader = true;

  //call the api function
  void callAPI() async {
    productsdata = await GetAPI().getproducts();
    cartdata = await GetAPI().getcartproducts();
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
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async {
        var data = await GetAPI().getcartproducts();
        setState(() {
          cartdata = data;
        });
      },
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: RichText(
                text: TextSpan(
                  text: 'Notion ',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'shopping',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400)),
                  ],
                ),
              ),
              actions: [
                InkWell(
                  //navigate to add to cart list
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen())),
                  child: Stack(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 12, top: 10),
                      child: Icon(
                        CupertinoIcons.cart,
                        color: primary,
                        size: 24,
                      ),
                    ),
                    Positioned(
                        right: 5,
                        child: loader
                            ? Text("0")
                            : CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Text(
                                  cartdata!.data!.length.toString(),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ))
                  ]),
                ),
              ]),
          body: loader
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Enjoy Your ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primary),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Special',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text("Delicious Food",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: shadowdecoration,
                        child: Image.asset(
                          "assets/1.jpg",
                          fit: BoxFit.fill,
                          height: 200,
                          width: width,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                          child: Text("*****  Products  *****",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green))),
                      ListProduct(
                        productsdata: productsdata!,
                      )
                    ],
                  ),
                )),
    );
  }
}
