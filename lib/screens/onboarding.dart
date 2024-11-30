import 'package:brand_store_app/screens/auth/login_screen.dart';
import 'package:brand_store_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/cover.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "Find The\nBest Collections",
                      style: GoogleFonts.imprima(
                          height: 1.2,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.textScalerOf(context).scale(35)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get your dream item easily with FashionHub\nand get other interesting offer",
                      style: GoogleFonts.imprima(
                          fontSize: MediaQuery.textScalerOf(context).scale(12),
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .colorScheme
                              .inverseSurface
                              .withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.imprima(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              side: const BorderSide(
                                  width: 1, color: Colors.orange),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.imprima(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
