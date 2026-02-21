import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/auth/view/signup_view.dart';
import 'package:yummy/root.dart';
import 'package:yummy/shared/yummy_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _imageController;
  late AnimationController _shimmerController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<double> _imageFadeAnimation;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animation controller 
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Image animation controller
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Shimmer animation controller
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Logo scale animation 
    _logoScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutCubic, 
    ));

    // Logo fade animation 
    _logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    ));

    // Image slide animation (from bottom)
    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOutCubic,
    ));

    // Image fade animation
    _imageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeIn,
    ));

    // Shimmer animation
    _shimmerAnimation = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));

    // Start animations sequence
    _startAnimations();
  }

  void _startAnimations() async {
    // Start logo animation immediately
    _logoController.forward();

    // Wait a bit, then start image animation
    await Future.delayed(const Duration(milliseconds: 800));
    _imageController.forward();

    // Start shimmer animation and repeat
    await Future.delayed(const Duration(milliseconds: 400));
    _shimmerController.repeat(reverse: true);

    // Navigate to next screen after splash duration
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> RootView()));
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _imageController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Animated background gradient circles
          Positioned(
            top: -100,
            right: -100,
            child: AnimatedBuilder(
              animation: _shimmerController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_shimmerAnimation.value * 0.05),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: AnimatedBuilder(
              animation: _shimmerController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 - (_shimmerAnimation.value * 0.05),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                );
              },
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(200),
                
                // Animated logo 
                FadeTransition(
                  opacity: _logoFadeAnimation,
                  child: ScaleTransition(
                    scale: _logoScaleAnimation,
                    child: const YummyLogo(),
                  ),
                ),

                const Spacer(),

                // Animated bottom image
                SlideTransition(
                  position: _imageSlideAnimation,
                  child: FadeTransition(
                    opacity: _imageFadeAnimation,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Shimmer effect overlay
                        AnimatedBuilder(
                          animation: _shimmerAnimation,
                          builder: (context, child) {
                            return ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: const [
                                    Colors.transparent,
                                    Colors.white24,
                                    Colors.transparent,
                                  ],
                                  stops: [
                                    _shimmerAnimation.value - 0.3,
                                    _shimmerAnimation.value,
                                    _shimmerAnimation.value + 0.3,
                                  ],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: Image.asset(
                                "assets/Images/splash/splash_logo.png",
                              ),
                            );
                          },
                        ),
                        // Original image
                        Image.asset(
                          "assets/Images/splash/splash_logo.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}