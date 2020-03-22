import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "My photos",
        "ru_ru": "Мои фото",
      } +
      {
        "en_us": "Take photo",
        "ru_ru": "Снять",
      } +
      {
        "en_us": "Add photo",
        "ru_ru": "Добавить фотографию",
      } +
      {
        "en_us": "Gallery",
        "ru_ru": "Выбрать",
      };

  String get i18n => localize(this, _t);
}
