import 'package:flutter/material.dart';

class AdditionCart extends StatelessWidget {
  const AdditionCart({super.key, required this.onAdd , required this.itemName, required this.imagePath , required this.isSelected});


   final String imagePath ;
   final String itemName ;
   final VoidCallback? onAdd;
   final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              width: 85,
              height: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 85,
                      height: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isSelected ? Colors.green : const Color(0xff3C2F2F),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                             Text(
                              itemName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),

                            GestureDetector(
                              onTap: onAdd,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffEF2A39),
                                ),
                                child: isSelected ?  Icon(
                                   Icons.remove,
                                  color: Colors.white,
                                  size: 12,
                                )  :   Icon(
                                   Icons.add,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 61,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff00000026).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}