import "package:flutter/material.dart";
import "package:upgrader/upgrader.dart";
import "package:upgrader_demo/singleton/upgrader_singleton.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  String currentVersion = "";
  String latestVersion = "";

  @override
  void initState() {
    super.initState();
    currentVersion = Upgrader.sharedInstance.currentInstalledVersion() ?? "";
    latestVersion = Upgrader.sharedInstance.currentAppStoreVersion() ?? "";
    WidgetsBinding.instance.addPostFrameCallback(
      (Duration timeStamp) async {
        await UpgraderSingleton().showUpgradeAlertDialog();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upgrader Demo"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "The upgrader package needs the published app in the Google Play Store or the Apple App Store. This package checks whether an update of an app is available or not & it is determined by the app's unique identifier. (For Apple, it's called Bundle identifier & For Android, it's called Package name.) In this Demo app, I am using the unique identifier of Roblox because, at this moment, I don't have an active developer account. ",
                ),
                const SizedBox(height: 15),
                const Text(
                  "The Bundle identifier of Roblox:\n'com.roblox.robloxmobile'",
                ),
                const SizedBox(height: 15),
                const Text(
                  "The package name of Roblox:\n'com.roblox.client'",
                ),
                const SizedBox(height: 15),
                const Text(
                  "So, by using this trick, the upgrader package considers this demo app as an actual Roblox app.",
                ),
                const SizedBox(height: 15),
                Text(
                  "Current Version:\n$currentVersion",
                ),
                const SizedBox(height: 15),
                Text(
                  "Latest Version:\n$latestVersion",
                ),
                const SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.new_releases_outlined),
        label: const Text("Show Upgrader Dialog"),
        onPressed: UpgraderSingleton().showUpgradeAlertDialog,
      ),
    );
  }
}
