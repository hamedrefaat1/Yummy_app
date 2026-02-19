import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
class SliderSpicy extends StatelessWidget {
  const SliderSpicy({
    super.key,
    this.onChanged,
    required this.currentSliderValue,
  });

  final double currentSliderValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Spiciness Level",
                style: TextStyle(
                  color: Color(0xff3C2F2F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${currentSliderValue.toInt()}/10",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            ),
            child: Slider(
              value: currentSliderValue,
              onChanged: onChanged,
              min: 1,
              max: 10,
              divisions: 9, 
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text("🥶", style: TextStyle(fontSize: 20)),
                    Text("Mild", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Column(
                  children: const [
                    Text("🥵", style: TextStyle(fontSize: 20)),
                    Text("Hot", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}