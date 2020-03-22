import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_filter/providers/photo.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/screens/image/index.dart';
import 'package:photo_filter/screens/main/presenter.dart';
import 'package:photo_filter/screens/main/widgets/empty.dart';
import 'package:photo_filter/screens/main/widgets/image_card.dart';
import 'package:photo_filter/widgets/appbar.dart';
import 'package:photo_filter/widgets/loading.dart';
import 'package:provider/provider.dart';
import './index.i18n.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double toolbarHeight = 120;
  double leftPadding = 22;
  MainPresenter presenter = MainPresenter();

  @override
  void initState() {
    PhotoProvider().start().then(
          (_) => presenter.setLoading(false),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PhotoProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(
                'Add photo'.i18n,
                style: PFText.display,
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    var image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (_) => ImageScreen(image: image),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Take photo'.i18n,
                    style: PFText.button,
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (image != null) {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (_) => ImageScreen(image: image),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Gallery'.i18n,
                    style: PFText.button,
                  ),
                )
              ],
            ),
          );
        },
        backgroundColor: DynamicTheme.of(context).brightness == Brightness.light
            ? PFColors.text
            : PFColors.primary,
        child: Icon(EvaIcons.plus),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            PFAppbar(
              title: 'My photos'.i18n,
              toolbarHeight: toolbarHeight,
              leftPadding: leftPadding,
              withSettings: true,
            )
          ];
        },
        body: SafeArea(
          child: StreamBuilder(
              stream: presenter.loading,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == false) {
                    return provider.images.length == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[EmptyWidget()],
                          )
                        : SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: List.generate(
                                    provider.images.length,
                                    (index) => Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: ImageCard(
                                                image: provider
                                                    .images[index],
                                              ),
                                            ),
                                          ],
                                        )),
                              ),
                            ),
                          );
                  } else {
                    return PFLoading();
                  }
                } else
                  return PFLoading();
              }),
        ),
      ),
    );
  }
}
