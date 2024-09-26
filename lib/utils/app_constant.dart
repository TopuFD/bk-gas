import 'package:bk_gas/model/language_model.dart';
import 'package:bk_gas/utils/image.dart';

class AppConstant{
    static List<LanguageModel> languages = [
    LanguageModel(imageUrl: AppImage.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    // LanguageModel(imageUrl: Images.arabic, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(imageUrl: AppImage.bd, languageName: 'Bengali', countryCode: 'BD', languageCode: 'bn'),
    // LanguageModel(imageUrl: Images.india, languageName: 'Hindi', countryCode: 'IN', languageCode: 'hi'),
    // LanguageModel(imageUrl: Images.spain, languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
  ];
}