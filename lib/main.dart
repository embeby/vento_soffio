import 'package:flutter/material.dart';
import 'package:mostafa/provider/Settings_provider.dart';
import 'package:provider/provider.dart';
import 'my_app/my_app.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: MyApp()));
}
