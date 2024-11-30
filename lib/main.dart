import 'package:brand_store_app/firebase_options.dart';
import 'package:brand_store_app/screens/onboarding.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Brand Store App',
      themeMode: ThemeMode.light,
      theme: ShadThemeData(
          colorScheme: const ShadOrangeColorScheme.light(),
          brightness: Brightness.light),
      darkTheme: ShadThemeData(
          colorScheme: const ShadOrangeColorScheme.dark(),
          brightness: Brightness.dark),
      home: const Onboarding(),
    );
  }
}
