import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notion_task/api/postapi.dart';
import 'package:notion_task/model/getcartmodel.dart';


class CartCard extends StatefulWidget {
  final CartData data;
  const CartCard({super.key, required this.data});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset("assets/addcart.png"),
                Container(
                  color: Colors.green,
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.menuName.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.data.size.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "₹ ${widget.data.menuPrice.toString()}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
        const Positioned(
            right: 0,
            top: 0,
            child: Icon(
              CupertinoIcons.delete,
              size: 20,
              color: Colors.green,
            )),
        Positioned(
            right: 0,
            bottom: 20,
            child: Row(
              children: [
                InkWell(
                  onTap: () => AddProduct()
                      .quntityupdate(cartid: widget.data.id, status: "Remove"),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        color: Colors.green,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.data.quantity.toString(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => AddProduct()
                      .quntityupdate(cartid: widget.data.id, status: "Add"),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: Colors.green,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ))
      ],
    );
  }
}
