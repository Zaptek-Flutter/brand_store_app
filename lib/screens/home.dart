import 'package:brand_store_app/data/shirt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final categories = ["All", "Men", "Women", "Kids", "Others"];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: 0,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.orange,
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
                        color: Colors.black.withOpacity(0.6),
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
                                  selectedCategory = index;
                                });
                              },
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: GoogleFonts.imprima(
                                    color: selectedCategory == index
                                        ? Colors.white
                                        : Colors.black,
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
                  itemCount: Shirt.shirts.length,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 10,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(Shirt.shirts[index].image),
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
                                      onPressed: () {},
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$${Shirt.shirts[index].price}",
                            style: GoogleFonts.imprima(
                                fontSize:
                                    MediaQuery.textScalerOf(context).scale(20),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Shirt.shirts[index].name,
                            style: GoogleFonts.imprima(
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                              color: Colors.black.withOpacity(0.6),
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
