import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mostafa/presentation/home/tabs/SettingsTab/modifyData/modify_data_button_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedLang = "English";
  String? selectedTheme = "light";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  onTap: () {
                    ModifyDataButtonSheet.show(context);
                  },
                  child: const Padding(
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
                    child: const Image(image: AssetImage(AssetsManager.personImage))),
                const SizedBox(
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
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0xFF2A2A2A),
            child: Container(
              width: double.infinity,
              height: 440.h,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                              height: 40,
                              child: const Image(
                                  image: AssetImage(AssetsManager.themeImage))),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppLocalizations.of(context)!.theme,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          const Spacer(),
                          const SizedBox(
                            width: 27,
                          ),
                          DropdownButton<String>(
                            borderRadius: BorderRadius.circular(30),
                            dropdownColor: Colors.black,
                            hint: Text(
                              selectedTheme ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                            elevation: 0,
                            style: const TextStyle(color: Colors.white),
                            items: <String>[
                              AppLocalizations.of(context)!.light,
                              AppLocalizations.of(context)!.dark
                            ].map((String value) {
                              selectedTheme = value;
                              return DropdownMenuItem<String>(
                                value: selectedTheme,
                                child: Text(selectedTheme ?? ''),
                              );
                            }).toList(),
                            onChanged: (newTheme) {
                              selectedTheme = newTheme;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white38, thickness: 2),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 40,
                            child: Image(
                                image: AssetImage(AssetsManager.languageImage)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppLocalizations.of(context)!.language,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          const Spacer(),
                          DropdownButton<String>(
                            borderRadius: BorderRadius.circular(30),
                            elevation: 0,
                            hint: Text(
                              selectedLang ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            items: <String>[
                              AppLocalizations.of(context)!.english,
                              AppLocalizations.of(context)!.arabic
                            ].map((String value) {
                              selectedLang = value;
                              return DropdownMenuItem<String>(
                                value: selectedLang,
                                child: Text(selectedLang ?? ''),
                              );
                            }).toList(),
                            onChanged: (newLanguage) {
                              selectedLang = newLanguage;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white38, thickness: 2),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 40,
                              child: Image(
                                  image: AssetImage(AssetsManager.logUotImage)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppLocalizations.of(context)!.logOut,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white38, thickness: 2),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
