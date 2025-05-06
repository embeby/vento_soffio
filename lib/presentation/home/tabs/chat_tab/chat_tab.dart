import 'package:flutter/material.dart';
import 'package:mostafa/core/utils/assets_manager.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:mostafa/presentation/home/tabs/chat_tab/widget/loading_widget.dart';

import '../../../../l10n/app_localizations.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.chat)),
      body: Column(
        children: [
          const Expanded(child: TaskProgressExample()),
          const Divider(
            color: Colors.white60,
            thickness: 2,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.chatRoute);
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                        image: AssetImage(AssetsManager.logoSplash)),
                  ),
                ),
                const SizedBox(width: 15),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.customerService,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Colors.white60,
            thickness: 2,
          ),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
