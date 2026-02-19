

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/features/cart/components/item_card.dart';
import 'package:yummy/features/cart/data/cart_model.dart';
import 'package:yummy/features/cart/data/data_repo.dart';
import 'package:yummy/features/checkout/views/checkout_view.dart';
import 'package:yummy/shared/custom_button.dart';
import 'package:yummy/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int quntitey = 1;

  List<CartModel> items = DummyDataCart.items;

 

  double get totalPrice {
     double totalPrice = 0;
    for (int i = 0; i < items.length; i++) {
      totalPrice += items[i].product.price  * items[i].qty ;
    }
    return totalPrice;
  }

  void add(int index) {
    setState(() {
      items[index].qty++;
    });
  }

  void minus(int index) {
    if (items[index].qty > 1) {
      setState(() {
        items[index].qty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: items.isEmpty  ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            Gap(20),
            CustomText(
              text: "Your cart is empty",
              size: 20,
              wight: FontWeight.w600,
              color: Colors.black87,
            ),
            Gap(10),
            CustomText(
              text: "Looks like you haven't added anything yet.",
              size: 14,
              wight: FontWeight.w400,
              color: Colors.black54,
            ),
          ],
        ),
      )
    : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 100),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: ItemCard(
                quntitey: item.qty,
                imageItem: item.product.image,
                titleItem: item.product.name,
                descItem: item.product.desc,
                onDelete: () {
                  setState(() {
                    items.remove(item);
                  });
                },
                add: () {
                  add(index);
                },

                minus: () {
                  minus(index);
                },
              ),
            );
          },
        ),
      ),

      bottomSheet: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Total Price",
                  size: 16,
                  wight: FontWeight.w600,
                  color: Colors.black54,
                ),
                Gap(5),
                CustomText(
                 text: "\$ ${totalPrice.toStringAsFixed(2)}",
                  size: 20,
                  wight: FontWeight.w800,
                  color: const Color.fromARGB(255, 255, 100, 69),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => CheckoutView( totalPrice: totalPrice,)),
                );
              },
              child: CustomButton(text: "Chechout"),
            ),
          ],
        ),
      ),
    );
  }
}
