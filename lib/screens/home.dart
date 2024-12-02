import 'package:brand_store_app/data/shirt.dart';
import 'package:brand_store_app/models/shirt_model.dart';
import 'package:brand_store_app/screens/cart.dart';
import 'package:brand_store_app/screens/details.dart';
import 'package:brand_store_app/widgets/items_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final categories = ["All", "Men", "Women", "Others"];
  int selectedCategory = 0;
  List<ShirtModel> selectedItems = Shirt.allItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inverseSurface,
        elevation: 0,
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        leadingWidth: 100,
        primary: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            size: 40,
            AssetImage("assets/icons/menu.png"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              size: 40,
              AssetImage("assets/icons/profile.png"),
            ),
          )
        ],
      ),
      bottomNavigationBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "Explore",
                      style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.textScalerOf(context).scale(40)),
                    ),
                    Text(
                      "Best Trendy Collections!",
                      style: GoogleFonts.imprima(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedCategory == index
                                    ? Colors.orange
                                    : Colors.transparent),
                            margin: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  switch (index) {
                                    case 0:
                                      selectedItems = Shirt.allItems();
                                      selectedCategory = index;
                                      break;
                                    case 1:
                                      selectedItems = Shirt.menShirts;
                                      selectedCategory = index;
                                      break;
                                    case 2:
                                      selectedItems = Shirt.womenDresses;
                                      selectedCategory = index;
                                      break;
                                    case 3:
                                      selectedItems = Shirt.beauty;
                                      selectedCategory = index;
                                      break;
                                  }
                                });
                              },
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: GoogleFonts.imprima(
                                    color: selectedCategory == index
                                        ? Colors.white
                                        : Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                    fontSize: MediaQuery.textScalerOf(context)
                                        .scale(15),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ItemsGridview(
                  selectedItems: selectedItems,
                  tagPrefix: "home",
                ),
              ))
        ],
      ),
    );
  }
}
