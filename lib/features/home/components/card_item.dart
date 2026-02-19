import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/shared/custom_text.dart';
class CardItem extends StatelessWidget {
  final String name;
  final String desc;
  final String rate;
  final String image;
  final double price;

  const CardItem({
    super.key,
    required this.price,
    required this.image,
    required this.name,
    required this.desc,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            SizedBox(
              height: 110,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

            const Gap(8),

            /// Name
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xff3C2F2F),
              ),
            ),

            const Gap(4),

            /// Description
            Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),

            const Spacer(),

            /// Rating
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Icons/star.svg",
                      height: 16,
                    ),
                    const Gap(5),
                    CustomText(
                      text: rate,
                      size: 14,
                      color: Colors.black,
                      wight: FontWeight.w600,
                    ),
                  ],
                ),
                Spacer(),
                CustomText(
                      text: "\$$price",
                      size: 14,
                      color : AppColors.primary,
                      wight: FontWeight.w600,
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
