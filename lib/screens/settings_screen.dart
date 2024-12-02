import 'package:brand_store_app/providers/theme_provider.dart';
import 'package:brand_store_app/screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
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
            onPressed: () {},
            icon: const ImageIcon(
              size: 40,
              AssetImage("assets/icons/profile.png"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text('Dark Theme',
                      style: GoogleFonts.imprima(fontSize: 18)),
                  trailing: ShadSwitch(
                    value: ref.watch(themeModeProvider) == ThemeMode.dark,
                    onChanged: (value) {
                      ref.read(themeModeProvider.notifier).toggleTheme();
                    },
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title:
                      Text('About', style: GoogleFonts.imprima(fontSize: 18)),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title:
                      Text('Logout', style: GoogleFonts.imprima(fontSize: 18)),
                  onTap: () async {
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      await FirebaseAuth.instance.signOut();
                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
