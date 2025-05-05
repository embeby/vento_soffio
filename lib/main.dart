import 'package:flutter/material.dart';
import 'package:mostafa/provider/Settings_provider.dart';
import 'package:provider/provider.dart';
import 'my_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
      create: (context) => SettingsProvider()..getTheme(),
      child: const MyApp()));
}
