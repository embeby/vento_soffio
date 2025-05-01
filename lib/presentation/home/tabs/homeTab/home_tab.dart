import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            // width: double.infinity,
            // height: 250.h,
            decoration: const BoxDecoration(
                // color: Color(0xFF0C0077),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Image.asset(
              AssetsManager.logoSplash,
              height: 200.h,
              width: double.infinity,
            ),
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.welcomeT,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  AppLocalizations.of(context)!.companyIntroduction,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
