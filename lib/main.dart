import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transport_belarus/screens/main_screen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    const MainScreen(),
  );
}
