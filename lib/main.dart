import 'dart:async';
import 'dart:io';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:photo_filter/providers/photo.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

import 'providers/init.dart';
import 'screens/main/index.dart';
import 'utils/database.dart';

bool isInDebugMode = false;
void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode)
      FlutterError.dumpErrorToConsole(details);
    else
      Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Platform.isAndroid)
    foundation.debugDefaultTargetPlatformOverride = TargetPlatform.android;
  else
    foundation.debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  await DataBase().open();

  runZoned<Future<void>>(() async {
    startHome();
  }, onError: (error, stackTrace) async {
    print('Caught error: $error');
    print(stackTrace);
  });
}

String mapStyle;
final navigatorKey = GlobalKey<NavigatorState>();

void startHome() async {
  runApp(
    DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          color: PFColors.primary,
          theme: theme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', "US"),
            const Locale('ru', "RU"),
          ],
          builder: (context, child) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return Container(
                color: Colors.black,
                child: Text(
                  "Произошла ошибка. Попробуйте позже",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              );
            };
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => InitProvider()),
                ChangeNotifierProvider(create: (_) => PhotoProvider()),
              ],
              child: I18n(child: child),
            );
          },
          home: Consumer<InitProvider>(
            builder: (_, InitProvider p, __) {
              if (p.state == InitState.loading) return PFLoading();
              if (p.state == InitState.inited) return MainScreen();
              return Container();
            },
          ),
        );
      },
    ),
  );
}
