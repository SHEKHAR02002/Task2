import 'package:flutter/material.dart';
import 'package:notion_task/model/getmodel.dart';
import 'package:notion_task/screen/customwidget/productcard.dart';

class ListProduct extends StatefulWidget {
  final GetProduct productsdata;
  const ListProduct({super.key, required this.productsdata});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.productsdata.data!.length,
        itemBuilder: (context, index) {
          var products = widget.productsdata.data![index];
          // Call Product Cart Custom Widget
          return ProductCard(
            products: products,
          );
        });
  }
}
