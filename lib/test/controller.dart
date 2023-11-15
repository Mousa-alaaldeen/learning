import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
class AdHomeController extends GetxController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  String adUnit = 'ca-app-pub-3027891125673377/7694508835';

  @override
  void onInit() {
    super.onInit();
    initBannerAd();
  }

  @override
  void onClose() {
    super.onClose();
    bannerAd.dispose();
  }

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit,
      listener: BannerAdListener(onAdLoaded: (ad) {
        isAdLoaded = true;
        update();
      }, onAdFailedToLoad: ((ad, error) {
        ad.dispose();
        // ignore: avoid_print
                print("===========================================================================");

        print(error);
                        print("===========================================================================");

      })),
      request: const AdRequest(),
    );
    bannerAd.load();
  }
}