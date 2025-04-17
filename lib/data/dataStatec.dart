import 'package:flutter/cupertino.dart';
import '../core/utils/assets_magaer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataStatic {
  String image;
  String description;

  DataStatic({
    required this.image,
    required this.description,
  });

  static List<DataStatic> generateDataStatic(BuildContext context) {
    return [
      DataStatic(
        image: AssetsManager.MobileImage,
        description: AppLocalizations.of(context)!.mobileDescription,
      ),
      DataStatic(
        image: AssetsManager.backEndImage,
        description:
        AppLocalizations.of(context)!.backEndDescription
      ),
      DataStatic(
        image: AssetsManager.webImage,
        description:
        AppLocalizations.of(context)!.webDescription
      ),
      DataStatic(
        image: AssetsManager.UiUxImage,
        description:
        AppLocalizations.of(context)!.uiUxDescription
      ),
      DataStatic(
        image: AssetsManager.ItImage,
        description:
        AppLocalizations.of(context)!.itDescription
      ),
    ];
  }
}
