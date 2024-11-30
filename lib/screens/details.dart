import 'package:brand_store_app/models/shirt_model.dart';
import 'package:brand_store_app/widgets/animated_price.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.shirt});

  final ShirtModel shirt;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.inverseSurface,
          elevation: 0,
          forceMaterialTransparency: true,
          toolbarHeight: 100,
          leadingWidth: 100,
          primary: true,
          centerTitle: true,
          title: Text("Details", style: GoogleFonts.imprima(fontSize: 25)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const ImageIcon(
              size: 30,
              AssetImage("assets/icons/back_arrow.png"),
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 30),
              onPressed: () {},
              icon: const ImageIcon(
                size: 30,
                AssetImage("assets/icons/save.png"),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Hero(
                  tag: widget.shirt.image,
                  child: (widget.shirt.networkImage == null ||
                          widget.shirt.networkImage! == false)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            widget.shirt.image,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Stack(
                            children: [
                              Container(
                                // Replace with your actual height
                                width: double.infinity,
                                color: Theme.of(context).canvasColor,
                              ),
                              Center(
                                child: Image.network(
                                  widget.shirt.image
                                      .replaceAll('/1.png', '/thumbnail.png'),
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child; // Image  fully loaded
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: Theme.of(context)
                                          .colorScheme
                                          .surfaceDim,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        // Replace with your actual height
                                        width: double.infinity,
                                        color: Colors.grey[300],
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
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Hero(
                                tag: widget.shirt.name,
                                child: Text(
                                  widget.shirt.name,
                                  softWrap: true,
                                  style: GoogleFonts.imprima(
                                    fontSize: 30,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Size",
                        style: GoogleFonts.imprima(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.shirt.sizes!.map((e) {
                          return FilledButton(
                            onPressed: () {
                              setState(() {
                                selectedSize = widget.shirt.sizes!.indexOf(e);
                              });
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  widget.shirt.sizes?[selectedSize] == e
                                      ? Colors.orange
                                      : Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: const CircleBorder(),
                            ),
                            child: Text(
                              e,
                              style: GoogleFonts.imprima(fontSize: 20),
                            ),
                          );
                        }).toList(),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Hero(
                            tag: widget.shirt.price,
                            child: AnimatedPrice(
                                priceString: widget.shirt.price.toString()),
                          ),
                          const Spacer(),
                          FilledButton(
                            onPressed: () {
                              //todo: add to cart
                              Navigator.pop(context);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Add To Cart",
                              style: GoogleFonts.imprima(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
