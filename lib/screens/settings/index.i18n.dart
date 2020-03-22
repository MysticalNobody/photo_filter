import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Settings",
        "ru_ru": "Настройки",
      } +
      {
        "en_us": "Russian",
        "ru_ru": "Русский",
      } +
      {
        "en_us": "English",
        "ru_ru": "Английский",
      } +
      {
        "en_us": "Current language ",
        "ru_ru": "Текущий язык ",
      } +
      {
        "en_us": "Russian",
        "ru_ru": "Русский",
      } +
      {
        "en_us": "Change to Russian",
        "ru_ru": "Изменить на Русский",
      } +
      {
        "en_us": "Change to English",
        "ru_ru": "Изменить на Английский",
      } +
      {
        "en_us": "Light theme",
        "ru_ru": "Светлая тема",
      } +
      {
        "en_us": "Dark theme",
        "ru_ru": "Тёмная тема",
      } +
      {
        "en_us": "Switch to dark",
        "ru_ru": "Изменить на тёмную",
      } +
      {
        "en_us": "Switch to light",
        "ru_ru": "Изменить на светлую",
      };

  String get i18n => localize(this, _t);
}
