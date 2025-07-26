import 'package:basic_restaurant/core/utils/assets/app_assets.dart';

class AppConstants {
  static const String kIsDarkMode = 'isDark';
  static const String kToken = 'token';
  static List<Map<String, dynamic>> pages = const [
    {
      "image": AppAssets.boardingOne,
      "title": 'Select the\n Favorities Menu',
      "subtitle":
          "Now eat well, don't leave the house,You can choose your favorite food only with one click"
    },
    {
      "image": AppAssets.boardingTwo,
      "title": 'Good food at a \n cheap price',
      "subtitle": "You can eat at expensive restaurants withaffordable price"
    }
  ];
}
