import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/orderHistory/data/dummt_orders_repo.dart';
import 'package:yummy/shared/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const CustomText(
          text: "Order History",
          size: 20,
          wight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: DummyOrderRepo.orders.isEmpty
          ? Center(
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
                    text: "Your Order History is empty",
                    size: 20,
                    wight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  Gap(10),
                  CustomText(
                    text: "Looks like you haven't orders anything yet.",
                    size: 14,
                    wight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: DummyOrderRepo.orders.length,
              itemBuilder: (context, index) {
                final order = DummyOrderRepo.orders[index];
                final firstItem = order.items.first;

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      "Order #00${index + 125}", 
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const CustomText(
                                  text: "20 Oct, 2023 - 10:30 AM", 
                                  size: 12,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const CustomText(
                                text: "Delivered",
                                size: 12,
                                color: Colors.green,
                                wight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(thickness: 0.5),
                        ),

                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                firstItem.product.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.fastfood,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                              ),
                            ),
                            const Gap(15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: firstItem.product.name,
                                    size: 17,
                                    wight: FontWeight.bold,
                                  ),
                                  const Gap(5),
                                  CustomText(
                                    text:
                                        "${order.items.length} Items | Qty: x${firstItem.qty}",
                                    size: 13,
                                    color: Colors.grey[600],
                                  ),
                                  const Gap(5),
                                  CustomText(
                                    text:
                                        "\$${order.totalPrice.toStringAsFixed(2)}",
                                    size: 16,
                                    wight: FontWeight.w800,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Gap(20),

                       
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                             
                            },
                            child: const CustomText(
                              text: "Re-Order Now",
                              size: 16,
                              wight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
