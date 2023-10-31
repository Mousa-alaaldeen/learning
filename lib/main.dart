// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:learning/component/cache_helper.dart';
import 'package:learning/component/components.dart';

import 'package:learning/screen/splach/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  if (CacheHelper.getData(key: 'idAr') != null) {
    idAr = CacheHelper.getData(key: 'idAr');
  }
  if (CacheHelper.getData(key: 'idEn') != null) {
    idEn = CacheHelper.getData(key: 'idEn');
  }

  print('11111111111111111111');
  print(idAr);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2F5D7E),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
