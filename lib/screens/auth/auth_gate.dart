import 'package:brand_store_app/screens/main_screen.dart';
import 'package:brand_store_app/screens/onboarding.dart';
import 'package:brand_store_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges(),
      builder: (context, snapshot) {
        // Waiting for Firebase to establish a connection.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ShadProgress())),
          );
        }

        // Check if the user is logged in or not.
        if (snapshot.hasData) {
          // User is logged in, navigate to the home screen.
          return const MainScreen();
        } else {
          // User is not logged in, navigate to the login screen.
          return const Onboarding();
        }
      },
    );
  }
}
