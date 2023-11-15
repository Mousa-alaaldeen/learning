import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learning/component/components.dart';
import 'package:learning/test/controller.dart';
import 'package:get/get.dart';

class AdmobHome extends StatelessWidget {
  const AdmobHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdHomeController adController = Get.put(AdHomeController());

    return GetBuilder<AdHomeController>(builder: (_) {
      return adController.isAdLoaded
          ? SizedBox(
              height: adController.bannerAd.size.height.toDouble(),
              width: adController.bannerAd.size.width.toDouble(),
              child: AdWidget(ad: adController.bannerAd),
            )
          : Container(
              height: 200,
              width: 200,
              color: colors1,
            );
    });
  }
}
