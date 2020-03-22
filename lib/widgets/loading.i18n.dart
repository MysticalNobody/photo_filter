import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Loading... please wait",
        "ru_ru": "Подождите... идёт загрузка",
      };

  String get i18n => localize(this, _t);
}
