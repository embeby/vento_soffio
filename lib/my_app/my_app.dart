import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mostafa/aoth/LoginScreen/LoginScreen.dart';
import 'package:mostafa/aoth/createScreen/createScreen.dart';
import 'package:mostafa/aoth/splash/splash_screen.dart';
import 'package:mostafa/config/theme/my-theme.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:mostafa/provider/Settings_provider.dart';
import 'package:provider/provider.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/home/tabs/chatTab/chatScreen.dart';
import '../presentation/home/tabs/serviseTab/detalsServiess/detalsServiesscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context,listen: true);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale:Locale(provider.lan),
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.DarkTheme,
          themeMode:provider.currentTheme ,
          title: 'Vento soffio',
          debugShowCheckedModeBanner: false,
          routes: {
            RoutesManager.homeRoute: (_) => HomeScreen(),
            RoutesManager.splashRoute: (_) =>   SplashScreen(),
            RoutesManager.loginRoute: (_) => loginScreen(),
            RoutesManager.createRoute: (_) => createScreen(),
            RoutesManager.detailsRoute: (_) =>  detailsScreen(),
            RoutesManager.ChatRoute: (_) => ChatScreen(),
          },
          initialRoute: RoutesManager.splashRoute,
        );
      },
    );
  }
}
