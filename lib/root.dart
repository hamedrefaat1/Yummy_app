import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/auth/view/profile_view.dart';
import 'package:yummy/features/cart/views/cart_view.dart';
import 'package:yummy/features/home/views/home_view.dart';
import 'package:yummy/features/orderHistory/views/order_history.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;
  late PageController _pageController;
  final  List<Widget> _pages = [
    const HomeView(),
    const CartView(),
    const OrderHistory(),
    const ProfileView(),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const BouncingScrollPhysics(),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        
        backgroundColor: Colors.white,
        
        color: AppColors.primary,
        
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.receipt_long, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 300),
        index: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
