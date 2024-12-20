import 'package:brand_store_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index, ref) {
    final removedItem = ref.read(cartProvider)[index];
    ref.read(cartProvider.notifier).removeItem(removedItem.shirt);
    // Remove the item from the list with an animation
    _listKey.currentState?.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-1, 0), // Slide out to the left
            ).chain(CurveTween(curve: Curves.easeOut)),
          ),
          child: FadeTransition(
            opacity: animation,
            child: _buildListItem(context, removedItem, index, animation),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );

    // Trigger re-render for the remaining items to animate upwards
    setState(() {});
  }

  Widget _buildListItem(BuildContext context, CartItem selectedCartItem,
      int index, Animation<double> animation) {
    final selectedShirt = selectedCartItem.shirt;
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(0, 0.1), // Slightly below original position
          end: Offset.zero, // Slide upwards to its original position
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: FadeTransition(
        opacity: animation,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => _removeItem(index, ref),
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              children: [
                (selectedShirt.networkImage == null ||
                        selectedShirt.networkImage! == false)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          selectedShirt.image,
                          width: 150,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 180,
                              color: Theme.of(context).canvasColor,
                            ),
                            Image.network(
                              selectedShirt.image
                                  .replaceAll('/1.png', '/thumbnail.png'),
                              width: 150,
                              height: 180,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Image fully loaded
                                }
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 150,
                                    height: 180,
                                    color: Colors.grey[300],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedShirt.name,
                          softWrap: true,
                          style: GoogleFonts.imprima(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          selectedShirt.colors![0],
                          style: GoogleFonts.imprima(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withOpacity(0.7),
                          ),
                        ),
                        Text(
                          selectedShirt.sizes![0],
                          style: GoogleFonts.imprima(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withOpacity(0.7),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${selectedShirt.price}',
                          style: GoogleFonts.imprima(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "x${selectedCartItem.quantity}",
                        style: GoogleFonts.imprima(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inverseSurface,
        elevation: 0,
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        leadingWidth: 100,
        primary: true,
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.imprima(fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const ImageIcon(
            size: 30,
            AssetImage("assets/icons/back_arrow.png"),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "My Orders",
              style: GoogleFonts.imprima(
                fontSize: MediaQuery.textScalerOf(context).scale(30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: cartItems.isEmpty
                ? Center(
                    child: Text(
                    "No items in cart",
                    style: GoogleFonts.imprima(
                      fontSize: 30,
                      color: Theme.of(context)
                          .colorScheme
                          .inverseSurface
                          .withOpacity(0.7),
                    ),
                  ))
                : AnimatedList(
                    key: _listKey,
                    initialItemCount: cartItems.length,
                    itemBuilder: (context, index, animation) {
                      final selectedCartItem = cartItems[index];
                      return _buildListItem(
                          context, selectedCartItem, index, animation);
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Total Items (${cartItems.length})",
                      style: GoogleFonts.imprima(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ ${(ref.watch(cartProvider.notifier).totalCost).toStringAsFixed(2)}',
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Standard Delivery",
                      style: GoogleFonts.imprima(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 12.00',
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Total Payment",
                      style: GoogleFonts.imprima(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ ${(ref.watch(cartProvider.notifier).totalCost + 12).toStringAsFixed(2)}',
                      style: GoogleFonts.imprima(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      if (cartItems.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => ShadDialog(
                            child: Column(
                              children: [
                                Text(
                                  "No items in cart",
                                  style: GoogleFonts.imprima(fontSize: 20),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Close",
                                    style: GoogleFonts.imprima(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                      Navigator.pushNamed(context, '/checkout');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Check Out",
                      style: GoogleFonts.imprima(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
