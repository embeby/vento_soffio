import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/auth/splash/splash_screen.dart';
import 'package:mostafa/config/theme/my_theme.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:mostafa/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../auth/login_screen/login_screen.dart';
import '../auth/sign_screen/sign_screen.dart';
import '../l10n/app_localizations.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/home/tabs/chat_tab/chat_screen.dart';
import '../presentation/home/tabs/service_tab/details_services/details_services_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context, listen: true);
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
          locale: Locale(provider.lan),
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: provider.currentTheme,
          title: 'Vento Soffio',
          debugShowCheckedModeBanner: false,
          routes: {
            RoutesManager.homeRoute: (_) => const HomeScreen(),
            RoutesManager.splashRoute: (_) => const SplashScreen(),
            RoutesManager.loginRoute: (_) => const LoginScreen(),
            RoutesManager.createRoute: (_) => const SignScreen(),
            RoutesManager.detailsRoute: (_) => const DetailsScreen(),
            RoutesManager.chatRoute: (_) => const ChatScreenUser1(),
          },
          initialRoute: RoutesManager.splashRoute,
        );
      },
    );
  }
}
