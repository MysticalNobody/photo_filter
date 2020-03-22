part of './index.dart';

enum TextType { Title, Text }

class PFText {
  static TextStyle create(
          {TextType type = TextType.Text,
          double fontSize,
          FontWeight fontWeight,
          FontStyle fontStyle,
          Color color}) =>
      type == TextType.Title
          ? GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color)
          : GoogleFonts.sourceSansPro(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color);
  static TextStyle display =
      create(type: TextType.Title, fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle text = create(fontSize: 16);
  static TextStyle caption = create(fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle button = create(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
