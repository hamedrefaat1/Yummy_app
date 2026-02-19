// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/cart/data/cart_model.dart';
import 'package:yummy/features/cart/data/data_repo.dart';
import 'package:yummy/features/cart/views/cart_view.dart';
import 'package:yummy/features/home/data/product_model.dart';
import 'package:yummy/features/product_details/components/addition_cart.dart';
import 'package:yummy/features/product_details/components/slider_spicy.dart';
import 'package:yummy/features/product_details/data/data_repo.dart';
import 'package:yummy/features/product_details/data/topping_model.dart';
import 'package:yummy/shared/custom_button.dart';
import 'package:yummy/shared/custom_text.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.product});

  ProductModel product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

double currentSliderValue = 5;

class _ProductDetailsState extends State<ProductDetails> {
  DetailsRepo detailsRepo = DetailsRepo();
  List<ToppingModel>? toppings;

  List<ToppingModel>? options;

  List<int> selectedToppings = [];
  List<int> selectedOptions = [];

  CartRepo cartrepo = CartRepo();

  Future<void> getToppings() async {
    final res = await detailsRepo.getToppings();
    setState(() {
      toppings = res;
    });
  }

  Future<void> getOptions() async {
    final res = await detailsRepo.getOptions();
    setState(() {
      options = res;
    });
  }

  @override
  void initState() {
    super.initState();
    getToppings();
    getOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image product
            Center(
              child: Hero(
                tag: widget.product.id,
                child: Image.asset(
                  widget.product.image,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: widget.product.name,
                          size: 24,
                          wight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const Gap(5),
                            CustomText(
                              text: widget.product.rate,
                              size: 14,
                              wight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Gap(10),

                  // 3 desc and price
                  CustomText(
                    text: "\$ ${widget.product.price}",
                    size: 20,
                    color: AppColors.primary,
                    wight: FontWeight.bold,
                  ),
                  const Gap(15),
                  CustomText(
                    text: widget.product.desc,
                    size: 15,
                    color: Colors.grey[600],
                  ),

                  const Gap(25),
                  const Divider(),
                  const Gap(15),

                  // 4 (Spicy)
                  SliderSpicy(
                    currentSliderValue: currentSliderValue,
                    onChanged: (value) =>
                        setState(() => currentSliderValue = value),
                  ),

                  const Gap(25),

                  // 5 (Additions)
                  CustomText(
                    text: "Additions",
                    size: 18,
                    wight: FontWeight.w600,
                  ),
                  const Gap(15),
                  toppings == null
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: toppings!.length,
                            itemBuilder: (context, index) {
                              final item = toppings![index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: AdditionCart(
                                  imagePath: item.image,
                                  itemName: item.name,
                                  isSelected: selectedToppings.contains(
                                    item.id,
                                  ),
                                  onAdd: () {
                                    setState(() {
                                      selectedToppings.contains(item.id)
                                          ? selectedToppings.remove(item.id)
                                          : selectedToppings.add(item.id);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),

                  const Gap(25),

                  // 6. الخيارات (Options)
                  CustomText(
                    text: "Extra Options",
                    size: 18,
                    wight: FontWeight.w600,
                  ),
                  const Gap(15),
                  options == null
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: options!.length,
                            itemBuilder: (context, index) {
                              final item = options![index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: AdditionCart(
                                  imagePath: item.image,
                                  itemName: item.name,
                                  isSelected: selectedOptions.contains(item.id),
                                  onAdd: () {
                                    setState(() {
                                      selectedOptions.contains(item.id)
                                          ? selectedOptions.remove(item.id)
                                          : selectedOptions.add(item.id);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                  const Gap(100), // مساحة عشان الزرار مياكلش المحتوى
                ],
              ),
            ),
          ],
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
                  text: "\$ ${widget.product.price}",
                  size: 20,
                  wight: FontWeight.w800,
                  color: const Color.fromARGB(255, 255, 100, 69),
                ),
              ],
            ),

            GestureDetector(
              onTap: () async {
                final productCart =  CartModel(
                    product: widget.product,
                    qty: 1,
                    spicy: currentSliderValue,
                    toppings: selectedToppings,
                    options: selectedOptions,
                  );
               await cartrepo.addProductToCart(
                  productCart
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => CartView()),
                );
              },
              child: CustomButton(text: "Add To Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
