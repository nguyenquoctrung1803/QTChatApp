import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/features/landing/screens/landing_screen.dart';
import 'package:flutter_chatapp/firebase_options.dart';
import 'package:flutter_chatapp/layouts/mobile_screen_layout.dart';
import 'package:flutter_chatapp/layouts/web_screen_layout.dart';
import 'package:flutter_chatapp/responsive/responsive_layout.dart';
import 'package:flutter_chatapp/routes.dart';
import 'package:flutter_chatapp/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          )),
      onGenerateRoute: (setting) => generateRoute(setting),
      home: LandingScreen(),
    );
  }
}
