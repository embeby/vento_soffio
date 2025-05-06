import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mostafa/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import 'my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider()..getTheme(),
      child: const MyApp()));
}
