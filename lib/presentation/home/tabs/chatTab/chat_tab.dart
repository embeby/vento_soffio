import 'package:flutter/material.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.chat)),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.ChatRoute);
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(AssetsManager.logoSplash)),
                  ),
                ),
                SizedBox(width: 15),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.customerService,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Divider(
            color: Colors.white60,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
