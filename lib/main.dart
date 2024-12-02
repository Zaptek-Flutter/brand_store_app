import 'package:brand_store_app/firebase_options.dart';
import 'package:brand_store_app/models/shirt_model.dart';
import 'package:brand_store_app/providers/theme_provider.dart';
import 'package:brand_store_app/screens/auth/login_screen.dart';
import 'package:brand_store_app/screens/auth/reset_password_screen.dart';
import 'package:brand_store_app/screens/auth/signup_screen.dart';
import 'package:brand_store_app/screens/cart.dart';
import 'package:brand_store_app/screens/checkout.dart';
import 'package:brand_store_app/screens/details.dart';
import 'package:brand_store_app/screens/main_screen.dart';
import 'package:brand_store_app/screens/onboarding.dart';
import 'package:brand_store_app/screens/settings_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return ShadApp(
      title: 'Brand Store App',
      themeMode: ref.watch(themeModeProvider),
      theme: ShadThemeData(
          colorScheme: const ShadOrangeColorScheme.light(),
          brightness: Brightness.light),
      darkTheme: ShadThemeData(
          colorScheme: const ShadOrangeColorScheme.dark(),
          brightness: Brightness.dark),
      routes: {
        '/main': (context) => const MainScreen(),
        '/cart': (context) => const Cart(),
        '/settings': (context) => const SettingsScreen(),
        'checkout': (context) => const Checkout(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments as Map<String, dynamic>;
          final String tagPrefix = args['prefix'];
          final ShirtModel shirt = args['shirt'];
          return MaterialPageRoute(
            builder: (context) => Details(
              shirt: shirt,
              tagPrefix: tagPrefix,
            ),
          );
        } else if (settings.name == '/cart') {
          return MaterialPageRoute(
            builder: (context) => const Cart(),
          );
        } else if (settings.name == '/settings') {
          return MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          );
        } else if (settings.name == '/checkout') {
          return MaterialPageRoute(
            builder: (context) => const Checkout(),
          );
        } else if (settings.name == '/login') {
          return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          );
        } else if (settings.name == '/signup') {
          return MaterialPageRoute(
            builder: (context) => const SignupScreen(),
          );
        } else if (settings.name == '/reset-password') {
          return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen(),
          );
        } else if (settings.name == '/main') {
          return MaterialPageRoute(
            builder: (context) => const MainScreen(),
          );
        } else if (settings.name == '/onboarding') {
          return MaterialPageRoute(
            builder: (context) => const Onboarding(),
          );
        }
        // Default fallback route
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      },
      home: const Onboarding(),
    );
  }
}
