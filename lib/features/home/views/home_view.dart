import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/features/home/components/card_item.dart';
import 'package:yummy/features/home/components/categories_section.dart';
import 'package:yummy/features/home/components/header_section.dart';
import 'package:yummy/features/home/components/search_bar_section.dart';
import 'package:yummy/features/home/data/data_repo.dart';
import 'package:yummy/features/home/data/product_model.dart';
import 'package:yummy/features/product_details/views/product_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel>? allProducts;
    List<ProductModel>? products;
  HomeRepo homeRepo = HomeRepo();
  Future<void> getallProducts() async {
    final data = await homeRepo.getProducts();
    setState(() {
      allProducts = data;
      products= data;
    });
  }
 TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getallProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Gap(50),
                // Header Section
                HeaderSection(),

                // Search Bar Section
                Gap(30),
                SearchBarSection(
                  searchContoller: searchController,
                  onChanged: (value){
                    final qurey = value.toLowerCase();
                  setState(() {
                     products =    allProducts?.where((p)=> p.name.toLowerCase().startsWith(qurey)).toList();
                  });
                  },
                ),

                Gap(30),

                // Categories Section
                CategoriesSection(),

                // Cards Items Section
                Expanded(
                  child: products == null
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          itemCount: products!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.69,
                              ),
                          itemBuilder: (context, index) {
                            final product = products![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => ProductDetails( product: product,),
                                  ),
                                );
                              },
                              child: CardItem(
                                price: product.price,
                                image: product.image,
                                rate: product.rate,
                                name: product.name,
                                desc: product.desc,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
