import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:mostafa/presentation/home/tabs/SettingsTab/modifyData/modify_data_button_sheet.dart';
import 'package:mostafa/provider/Settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  TextEditingController nameUController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context, listen: true);
    final Uri _url = Uri.parse('https://flutter.dev');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    String selectedTheme = provider.currentTheme == ThemeMode.light
        ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;

    String selectedLang = provider.lan == 'en'
        ? AppLocalizations.of(context)!.english
        : AppLocalizations.of(context)!.arabic;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Card(
            margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            color: const Color(0xFF2A2A2A),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  // InkWell(
                  //   onTap: () {
                  //     ModifyDataButtonSheet.show(context);
                  //   },
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         Image(image: AssetImage(AssetsManager.EditImage))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                      onTap: () {},
                      child: const Image(
                          image: AssetImage(AssetsManager.personImage))),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    nameUController.text,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  Text(
                    'user12455@gmsil.com',
                    style: TextStyle(color: Colors.white38, fontSize: 14.sp),
                  ),
                  Text(
                    phoneController.text,
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
              color: const Color(0xFF2A2A2A),
              child: SizedBox(
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
                            const SizedBox(
                                height: 40,
                                child: Image(
                                    image:
                                        AssetImage(AssetsManager.themeImage))),
                            const SizedBox(width: 15),
                            Text(
                              AppLocalizations.of(context)!.theme,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            const Spacer(),
                            DropdownButton<String>(
                              value: selectedTheme,
                              borderRadius: BorderRadius.circular(30),
                              dropdownColor: Colors.black,
                              style: const TextStyle(color: Colors.white),
                              items: <String>[
                                AppLocalizations.of(context)!.light,
                                AppLocalizations.of(context)!.dark
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newTheme) {
                                if (newTheme ==
                                    AppLocalizations.of(context)!.light) {
                                  provider.changeAppTheme(ThemeMode.light);
                                } else {
                                  provider.changeAppTheme(ThemeMode.dark);
                                }
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
                                  image:
                                      AssetImage(AssetsManager.languageImage)),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              AppLocalizations.of(context)!.language,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            const Spacer(),
                            DropdownButton<String>(
                              value: selectedLang,
                              borderRadius: BorderRadius.circular(30),
                              elevation: 0,
                              // hint: Text(selectedLang,style: TextStyle(color: Colors.white),),

                              style: const TextStyle(color: Colors.white),
                              dropdownColor: Colors.black,
                              items: <String>[
                                AppLocalizations.of(context)!.english,
                                AppLocalizations.of(context)!.arabic,
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newLanguage) {
                                if (newLanguage ==
                                    AppLocalizations.of(context)!.english) {
                                  provider.changeLan('en');
                                } else {
                                  provider.changeLan('ar');
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      const Divider(color: Colors.white38, thickness: 2),
                      InkWell(
                        onTap: () {
                          _launchUrl();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 40,
                                child: Image(
                                    image:
                                        AssetImage(AssetsManager.logUotImage)),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                AppLocalizations.of(context)!.aboutUs,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white38, thickness: 2),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context,RoutesManager.loginRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 40,
                                child: Image(
                                    image:
                                    AssetImage(AssetsManager.logUotImage)),
                              ),
                              const SizedBox(width: 15),
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
      ),
    );
  }
}
