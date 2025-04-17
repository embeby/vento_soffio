import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Card(
            margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0xFF2A2A2A),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(image: AssetImage(AssetsManager.EditImage))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child:
                          Image(image: AssetImage(AssetsManager.personImage))),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'user12455564',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  Text(
                    'user12455@gmsil.com',
                    style: TextStyle(color: Colors.white38, fontSize: 14.sp),
                  ),
                  Text(
                    '+20109842154',
                    style: TextStyle(color: Colors.white38, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              color: Color(0xFF2A2A2A),
              child: Container(
                width: double.infinity,
                height: 450.h,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                                child: Image(
                                    image: AssetImage(
                                        AssetsManager.scaancercalImage))),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              AppLocalizations.of(context)!.theme,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Divider(color: Colors.white38, thickness: 1),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                                child: Image(
                                    image: AssetImage(
                                        AssetsManager.scaancercalImage))),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              AppLocalizations.of(context)!.language,
                              style:
                              TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Divider(color: Colors.white38, thickness: 1),
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
