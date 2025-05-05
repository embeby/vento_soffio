import 'package:flutter/material.dart';
import 'package:mostafa/presentation/home/tabs/SettingsTab/Settings_tab.dart';
import 'package:mostafa/presentation/home/tabs/chatTab/chat_tab.dart';
import 'package:mostafa/presentation/home/tabs/homeTab/home_tab.dart';
import 'package:mostafa/presentation/home/tabs/serviseTab/servise_tab.dart';
import '../../core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Widget> tabs =[
     const HomeTab(),
     const ServiseTab(),
     const ChatTab(),
     const SettingsTab(),
   ];

   int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              selectedIndex=index;
            });
          },
          currentIndex: selectedIndex,
          iconSize: 30,
          items:   [
             BottomNavigationBarItem(
               backgroundColor: Colors.black,
               icon: const ImageIcon(AssetImage(AssetsManager.HomeIcon)), label:AppLocalizations.of(context)!.home ,),
             BottomNavigationBarItem(
               backgroundColor: Colors.black,
               icon: const ImageIcon(AssetImage(AssetsManager.ServiceIcon)), label: AppLocalizations.of(context)!.service,),
             BottomNavigationBarItem(
               backgroundColor: Colors.black,
               icon: const ImageIcon(AssetImage(AssetsManager.messageIcon)), label: AppLocalizations.of(context)!.chat,),
             BottomNavigationBarItem(
               backgroundColor: Colors.black,
               icon: const Icon(Icons.settings_outlined), label: AppLocalizations.of(context)!.settings,),
              ],
        ),
        body: tabs[selectedIndex],
      
      ),
    );
 }
}
