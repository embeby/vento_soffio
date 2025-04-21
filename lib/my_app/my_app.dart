import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mostafa/config/theme/my-theme.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import '../presentation/LoginScreen/LoginScreen.dart';
import '../presentation/createScreen/createScreen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/home/tabs/chatTab/chatScreen.dart';
import '../presentation/home/tabs/serviseTab/detalsServiess/detalsServiesscreen.dart';
import '../presentation/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          locale: const Locale('en'),
          theme: MyTheme.DarkeThme,
          title: 'Vento soffio',
          debugShowCheckedModeBanner: false,
          routes: {
            RoutesManager.homeRoute: (_) => HomeScreen(),
            RoutesManager.splashRoute: (_) =>  const SplashScreen(),
            RoutesManager.loginRoute: (_) => loginScreen(),
            RoutesManager.createRoute: (_) => createScreen(),
            RoutesManager.detailsRoute: (_) => const detailsScreen(),
            RoutesManager.ChatRoute: (_) => ChatScreen(),
          },
          initialRoute: RoutesManager.splashRoute,
        );
      },
    );
  }
}
