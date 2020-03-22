import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/widgets/appbar.dart';
import './index.i18n.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double toolbarHeight = 120;
  double leftPadding = 22;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset < 60) {
        setState(() {
          leftPadding = 22 + controller.offset;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              PFAppbar(
                title: 'Settings'.i18n,
                toolbarHeight: toolbarHeight,
                leftPadding: leftPadding,
                withBack: true,
              )
            ];
          },
          body: SafeArea(
              child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Current language '.i18n +
                      (I18n.locale == Locale('ru', "RU")
                          ? 'Russian'.i18n
                          : 'English'.i18n),
                  style: PFText.text,
                ),
                trailing: GestureDetector(
                  onTap: () => I18n.of(context).locale =
                      I18n.locale == Locale('ru', "RU")
                          ? Locale('en', "US")
                          : Locale('ru', "RU"),
                  child: Text(
                    I18n.locale == Locale('ru', "RU")
                        ? 'Change to English'.i18n
                        : 'Change to Russian'.i18n,
                    style: PFText.button.copyWith(fontSize: 10),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                  title: Text(
                    DynamicTheme.of(context).brightness == Brightness.light
                        ? 'Light theme'.i18n
                        : 'Dark theme'.i18n,
                    style: PFText.text,
                  ),
                  trailing: GestureDetector(
                    onTap: () => DynamicTheme.of(context).setBrightness(
                        DynamicTheme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light),
                    child: Text(
                      DynamicTheme.of(context).brightness == Brightness.light
                          ? 'Switch to dark'.i18n
                          : 'Switch to light'.i18n,
                      style: PFText.button.copyWith(fontSize: 10),
                    ),
                  )),
            ],
          ))),
    );
  }
}
