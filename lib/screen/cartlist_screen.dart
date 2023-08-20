import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notion_task/api/getapi.dart';
import 'package:notion_task/model/getcartmodel.dart';
import 'package:notion_task/screen/customwidget/cartproduct.dart';
import 'package:notion_task/theme.dart';

//Cart Screen
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //require datatype
  Cart? cartproductsdata;
  bool loader = true;

  //call the api function
  void callAPI() async {
    cartproductsdata = await GetAPI().getcartproducts();
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
            "CART",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: primary),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              CupertinoIcons.back,
              size: 25,
              color: primary,
            ),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            loader
                ? const CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartproductsdata!.data!.length,
                    itemBuilder: (context, index) {
                      var products = cartproductsdata!.data![index];
                      // Call Product Cart Custom Widget
                      return CartCard(
                        data: products,
                      );
                    }),

            const SizedBox(
              height: 40,
            ),

            //Below Bill

            const Text(
              "Bill Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Product Price (2 item)",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
                const Spacer(),
                Text(
                  "600",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Discount Charges",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
                const Spacer(),
                Text(
                  "300",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Delivery Charges",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
                const Spacer(),
                Text(
                  "Free",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              height: 2,
              color: primary,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
                Spacer(),
                Text(
                  "300",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
