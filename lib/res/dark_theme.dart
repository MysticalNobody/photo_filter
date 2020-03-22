part of './index.dart';

ThemeData darkTheme = ThemeData(
  canvasColor: Colors.transparent,
  brightness: Brightness.dark,
  primaryColor: PFColors.primaryDark,
  scaffoldBackgroundColor: PFColors.bgDark,
  cardColor: PFColors.bgDark,
  toggleableActiveColor: PFColors.primaryDark,
  iconTheme: IconThemeData(color: PFColors.primaryDark),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: PFColors.primary,
  ),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: PFColors.text),
    brightness: Brightness.dark,
    color: PFColors.bgDark,
    iconTheme: IconThemeData(color: PFColors.textDark),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: PFColors.textDark,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textTheme: TextTheme(
    headline6: TextStyle(color: PFColors.textDark),
  ),
  buttonTheme: ButtonThemeData(buttonColor: PFColors.primaryDark),
);
