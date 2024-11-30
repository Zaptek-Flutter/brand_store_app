import 'package:brand_store_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
        title: Text("Checkout", style: GoogleFonts.imprima(fontSize: 25)),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: GoogleFonts.imprima(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/quickmap.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "25/1, 2nd Floor, 1st Main, 1st Cross, "
                              "Koramangala",
                              softWrap: true,
                              style: GoogleFonts.imprima(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text("Change", style: GoogleFonts.imprima(fontSize: 15)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.clock,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Delivered in next 7 days",
                  style: GoogleFonts.imprima(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Payment Method",
              style: GoogleFonts.imprima(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/payment/visa.png",
                  width: 50,
                ),
                Image.asset(
                  "assets/images/payment/american-express.png",
                  width: 50,
                ),
                Image.asset(
                  "assets/images/payment/mastercard.png",
                  width: 50,
                ),
                Image.asset(
                  "assets/images/payment/paypal.png",
                  width: 50,
                ),
                Image.asset(
                  "assets/images/payment/apple-pay.png",
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Add Voucher",
                style: GoogleFonts.imprima(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                text: "Note : ",
                style: GoogleFonts.imprima(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: "Use your order id at the payment. Your Id ",
                    style: GoogleFonts.imprima(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: "#154619",
                    style: GoogleFonts.imprima(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text:
                        " if you forget to put your order id we can’t confirm the payment.",
                    style: GoogleFonts.imprima(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Total Items (3)",
                      style: GoogleFonts.imprima(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 150.00',
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
                        color: Colors.black.withOpacity(0.7),
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
                        color: Colors.black.withOpacity(0.7),
                        fontSize: MediaQuery.textScalerOf(context).scale(15),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 162.00',
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
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Payment"),
                              backgroundColor: Colors.white,
                              content: const Text("Payment Successful"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                )
                              ],
                            );
                          }).then((onValue) async {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                        );
                        await Future.delayed(const Duration(seconds: 2));
                        if (mounted) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      });
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
                      "Pay Now",
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
            )
          ],
        ),
      ),
    );
  }
}
