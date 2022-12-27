import "package:flutter/material.dart";
import "package:upgrader_demo/screen/home_screen.dart";
import "package:upgrader_demo/singleton/navigation_singleton.dart";
import "package:upgrader_demo/singleton/upgrader_singleton.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UpgraderSingleton().initializeUpgrader();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationSingleton().navigatorKey,
      title: "Upgrader Demo",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
