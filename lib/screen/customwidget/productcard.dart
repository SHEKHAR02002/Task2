import 'package:flutter/material.dart';
import 'package:notion_task/model/getmodel.dart';
import 'package:notion_task/theme.dart';

class ProductCard extends StatelessWidget {
  final Data products;
  const ProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: shadowdecoration,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.hotelName.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      products.name.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          products.discountedPrice.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          products.originalPrice.toString(),
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: secondary,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: primary),
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {},
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: primary),
                        )),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Image.network(
                      "https://www.cbc.ca/natureofthings/content/legacy/foodforthought_1920.jpg",
                      height: 80,
                      width: 120,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
