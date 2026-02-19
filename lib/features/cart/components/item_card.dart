import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.imageItem,
    required this.titleItem,
    required this.descItem,
    required this.quntitey,
    this.minus,
    this.add,
    this.onDelete, 
  });

  final String imageItem;
  final String titleItem;
  final String descItem;
  final int quntitey;
  final VoidCallback? minus;
  final VoidCallback? add;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          // 1. الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageItem,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(12),

          // 2. النصوص (الاسم والوصف)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: titleItem,
                  size: 16,
                  wight: FontWeight.bold,
                ),
                CustomText(
                  text: descItem,
                  size: 13,
                  color: Colors.grey,
                ),
                const Gap(8),
                // السعر ممكن يضاف هنا برضه
              ],
            ),
          ),

          // 3. التحكم في الكمية والحذف
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // زرار الحذف (أيقونة بدل كلمة كبيرة)
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 22),
              ),
              
              // الـ Counter
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: minus,
                      icon: const Icon(Icons.remove, size: 16),
                      constraints: const BoxConstraints(), // لتقليل مساحة الزرار
                      padding: const EdgeInsets.all(4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomText(text: quntitey.toString(), size: 14, wight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: add,
                      icon: const Icon(Icons.add, size: 16),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}