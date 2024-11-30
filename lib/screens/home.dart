import 'package:brand_store_app/data/shirt.dart';
import 'package:brand_store_app/models/shirt_model.dart';
import 'package:brand_store_app/screens/cart.dart';
import 'package:brand_store_app/screens/details.dart';
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BottomNavigationBar(
            backgroundColor: Colors.green,
            elevation: 0,
            currentIndex: 0,
            unselectedItemColor: Theme.of(context).colorScheme.inverseSurface,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.orange,
            onTap: (index) {
              setState(() {
                if (index == 2) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                }
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/search.png"),
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/bag.png"),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/settings.png"),
                ),
                label: "Settings",
              ),
            ]),
      ),
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
                child: MasonryGridView.builder(
                  itemCount: selectedItems.length,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 10,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final selectedShirt = selectedItems[index];
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: selectedShirt.image,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                (selectedShirt.networkImage == null ||
                                        selectedShirt.networkImage! == false)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(selectedShirt.image),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 200,
                                              // Replace with your actual height
                                              width: double.infinity,
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                            Image.network(
                                              selectedShirt.image.replaceAll(
                                                  '/1.png', '/thumbnail.png'),
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child; // Image fully loaded
                                                }
                                                return Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Container(
                                                    height: 200,
                                                    // Replace with your actual height
                                                    width: double.infinity,
                                                    color: Colors.grey[300],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                Positioned(
                                  right: 15,
                                  bottom: -25,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Details(shirt: selectedShirt),
                                            ),
                                          );
                                        },
                                        icon: const ImageIcon(
                                          AssetImage("assets/icons/bag.png"),
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Hero(
                            tag: selectedShirt.price,
                            child: Text(
                              "\$${selectedShirt.price}",
                              style: GoogleFonts.imprima(
                                  fontSize: MediaQuery.textScalerOf(context)
                                      .scale(20),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Hero(
                            tag: selectedShirt.name,
                            child: Text(
                              selectedShirt.name,
                              style: GoogleFonts.imprima(
                                fontSize:
                                    MediaQuery.textScalerOf(context).scale(14),
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                            ),
                          ),
                        ]);
                  },
                ),
              ))
        ],
      ),
    );
  }
}
