import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(AppLocalizations.of(context)!.customerService)),
      body: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (input) {
                    if(input==null||input.trim().isEmpty){
                      return '';
                    }
                  },
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                  decoration: InputDecoration(

                    hintText: AppLocalizations.of(context)!.send,
                    hintStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(AssetsManager.sendImage)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
