import 'package:brand_store_app/models/shirt_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.shirt.image,
                    fit: BoxFit.cover,
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
                        children: widget.shirt.sizes.map((e) {
                          return FilledButton(
                            onPressed: () {
                              setState(() {
                                selectedSize = widget.shirt.sizes.indexOf(e);
                              });
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  widget.shirt.sizes[selectedSize] == e
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
                          Text(
                            "\$${widget.shirt.price}",
                            style: GoogleFonts.imprima(
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(30),
                              fontWeight: FontWeight.bold,
                            ),
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
