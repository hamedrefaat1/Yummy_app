import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/cart/data/data_repo.dart';
import 'package:yummy/features/orderHistory/data/dummt_orders_repo.dart';
import 'package:yummy/features/orderHistory/data/order_model.dart';
import 'package:yummy/shared/custom_button.dart';
import 'package:yummy/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice});

  final double totalPrice;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPayMethod = "Cash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Order summary",
                size: 20,
                wight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
              Gap(15),
              checkoutText("Order", widget.totalPrice.toString()),
              checkoutText("Taxes", "0.3"),
              checkoutText("Delivery fees", "1.5"),
              Divider(thickness: 0.8, color: Color(0xffF0F0F0)),
              Gap(10),

              // total text
              totalText((widget.totalPrice + 0.3 + 1.5).toString()),

              // time Dlivery text
              dliveryText(),

              Gap(50),

              CustomText(
                text: "Payment methods",
                size: 20,
                wight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
              Gap(20),

              ListTile(
                onTap: () {
                  setState(() {
                    selectedPayMethod = "Cash";
                  });
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset(
                  "assets/Icons/dollar Background Removed 1.png",
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.primary,
                  value: "Cash",
                  groupValue: selectedPayMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPayMethod = value!;
                    });
                  },
                ),
                title: CustomText(
                  text: "Cash on Delivery",
                  color: Colors.white,
                  wight: FontWeight.w500,
                ),
              ),

              Gap(20),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedPayMethod = "Visa";
                  });
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Color(0xffF3F4F6),
                leading: Image.asset("assets/Icons/image 13.png"),
                trailing: Radio<String>(
                  activeColor: AppColors.primary,
                  value: "Visa",
                  groupValue: selectedPayMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPayMethod = value!;
                    });
                  },
                ),
                title: CustomText(
                  text: "Debit card",
                  color: Color(0xff3C2F2F),
                  wight: FontWeight.w500,
                  size: 14,
                ),
                subtitle: CustomText(
                  text: "3566 **** **** 0505",
                  color: Color(0xff808080),
                  wight: FontWeight.w500,
                  size: 14,
                ),
              ),

              Gap(10),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffEF2A39),
                    value: true,
                    onChanged: (value) {},
                  ),
                  CustomText(
                    text: "Save card details for future payments",
                    wight: FontWeight.w400,
                    color: Color(0xff808080),
                  ),
                ],
              ),
              Gap(100),
            ],
          ),
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
                  text: "\$${(widget.totalPrice + 0.3 + 1.5).toString()}",
                  size: 20,
                  wight: FontWeight.w800,
                  color: const Color.fromARGB(255, 255, 100, 69),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
               
                DummyOrderRepo.addOrder(
                  OrderModel(
                    items: List.from(DummyDataCart.items),
                    totalPrice: widget.totalPrice + 0.3 + 1.5,
                    date: DateTime.now(),
                  ),
                );

               
                DummyDataCart.items.clear();

                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 200,
                          horizontal: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.check,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Gap(15),
                              CustomText(
                                text: "Success",
                                wight: FontWeight.bold,
                                size: 25,
                              ),
                              Gap(10),
                              CustomText(
                                text:
                                    "   Your payment was successful.\n A receipt for this purchase has\n        been sent to your email.",
                                wight: FontWeight.w400,
                                color: Color(0xffBCBBBB),
                                size: 14,
                              ),
                              Gap(17),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CustomButton(text: "Colose"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: CustomButton(text: "Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget checkoutText(text1, text2) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text1,
          size: 18,
          wight: FontWeight.w400,
          color: Color(0xff7D7D7D),
        ),

        CustomText(
          text: "\$$text2",
          size: 18,
          wight: FontWeight.w400,
          color: Color(0xff7D7D7D),
        ),
      ],
    ),
  );
}

Widget totalText(String total) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Total",
          size: 18,
          wight: FontWeight.w600,
          color: Color(0xff3C2F2F),
        ),

        CustomText(
          text: "\$$total",
          size: 18,
          wight: FontWeight.w600,
          color: Color(0xff3C2F2F),
        ),
      ],
    ),
  );
}

Widget dliveryText() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Estimated delivery time:",
          size: 13,
          wight: FontWeight.w600,
          color: Color(0xff3C2F2F),
        ),

        CustomText(
          text: "15 - 30 mins",
          size: 13,
          wight: FontWeight.w600,
          color: Color(0xff3C2F2F),
        ),
      ],
    ),
  );
}
