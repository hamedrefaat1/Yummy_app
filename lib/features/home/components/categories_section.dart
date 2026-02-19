import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  List<String> categories = [
    "All",
    "Pizza",
    "Burgers",
    "Sushi",
    "Desserts",
    "Drinks",
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return     
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap:(){
              setState(() {
                selectedCategoryIndex = index;
              });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 50,
                      
                        decoration: BoxDecoration(
                          color:  selectedCategoryIndex == index ? AppColors.primary :  Color(0xfff3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: CustomText(
                            text: categories[index],
                            size: 15,
                            color: selectedCategoryIndex == index ? Colors.white :  Colors.black54,
                            wight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
          

          
  }
}