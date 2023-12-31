// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:learning/component/cache_helper.dart';
import 'package:learning/component/components.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning/screen/splach/splash_screen.dart';
import 'package:learning/screen/welcome_screen/welcom_screen.dart';

import 'package:learning/tesst.dart';
import 'generated/l10n.dart';

void main() async {
  //var devices=["2FF82A9EE01612D6547B4B068B80E73B"];
 WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  //  RequestConfiguration requestConfiguration=RequestConfiguration(testDeviceIds: devices);
  //  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
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
