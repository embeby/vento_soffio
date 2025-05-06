import 'package:flutter/material.dart';
import 'package:mostafa/presentation/home/tabs/SettingsTab/settings_tab.dart';
import 'package:mostafa/presentation/home/tabs/chat_tab/chat_tab.dart';
import 'package:mostafa/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:mostafa/presentation/home/tabs/service_tab/servise_tab.dart';

import '../../core/utils/assets_manager.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const HomeTab(),
    const ServiceTab(),
    const ChatTab(),
    SettingsTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: const ImageIcon(AssetImage(AssetsManager.homeIcon)),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: const ImageIcon(AssetImage(AssetsManager.serviceIcon)),
              label: AppLocalizations.of(context)!.service,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: const ImageIcon(AssetImage(AssetsManager.messageIcon)),
              label: AppLocalizations.of(context)!.chat,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: const Icon(Icons.settings_outlined),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
