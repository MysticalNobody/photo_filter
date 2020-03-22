import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/screens/settings/index.dart';

class PFAppbar extends StatelessWidget {
  const PFAppbar(
      {Key key,
      this.toolbarHeight,
      this.leftPadding,
      this.title,
      this.heroTitle,
      this.withBack,
      this.withSettings,
      this.onDone,
      this.share})
      : super(key: key);
  final double toolbarHeight;
  final double leftPadding;
  final String title;
  final String heroTitle;
  final bool withBack;
  final bool withSettings;
  final Function onDone;
  final Function share;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: toolbarHeight,
      pinned: true,
      elevation: 0,
      leading: withBack ?? false
          ? IconButton(
              icon: Icon(
                EvaIcons.arrowIosBack,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : SizedBox(),
      actions: <Widget>[
        if (withSettings ?? false)
          IconButton(
            icon: Icon(
              EvaIcons.settings2Outline,
              color: Theme.of(context).textTheme.headline6.color,
            ),
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => SettingsScreen(),
              ),
            ),
          ),
        if (share != null)
          IconButton(
              icon: Icon(
                EvaIcons.share,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              onPressed: share),
        if (onDone != null)
          IconButton(
              icon: Icon(
                EvaIcons.checkmark,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              onPressed: onDone)
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        titlePadding:
            EdgeInsets.symmetric(horizontal: leftPadding, vertical: 12),
        title: Text(
          title,
          style: PFText.display
              .copyWith(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
    );
  }
}
