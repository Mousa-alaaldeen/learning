// ignore_for_file: avoid_print

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learning/ads/ad_helper.dart';

class Ads {
  InterstitialAd? interstitialAd;
  void showAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            if (interstitialAd != null) {
              interstitialAd!.show();
            }

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdWillDismissFullScreenContent: (ad) {
                ad.dispose();
              },
            );
          },
          onAdFailedToLoad: (error) {

            print('55555555555');
            print(error.toString());
          },
        ));
  }
}
