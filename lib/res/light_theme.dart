part of './index.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: Colors.transparent,
  brightness: Brightness.light,
  primaryColor: PFColors.primary,
  primarySwatch: PFColors.primary,
  scaffoldBackgroundColor: PFColors.bg,
  backgroundColor: PFColors.bg,
  cardColor: PFColors.bg,
  toggleableActiveColor: PFColors.primary,
  iconTheme: IconThemeData(color: PFColors.text),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: PFColors.text),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: PFColors.text),
    brightness: Brightness.light,
    color: PFColors.bg,
    iconTheme: IconThemeData(color: PFColors.text),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: PFColors.text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textTheme: TextTheme(headline6: TextStyle(color: PFColors.text)),
  buttonTheme: ButtonThemeData(
    buttonColor: PFColors.text,
    textTheme: ButtonTextTheme.accent,
  ),
);
