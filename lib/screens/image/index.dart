import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image/image.dart';
import 'package:path/path.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/utils/image_filter/photofilters.dart';
import 'package:photo_filter/widgets/loading.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key key, this.image}) : super(key: key);
  final File image;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File get image => widget.image;
  var byteImage;
  var localImage;
  bool loaded = false;

  @override
  void initState() {
    byteImage = decodeImage(image.readAsBytesSync());
    localImage = copyResize(byteImage, width: 640);
    setState(() {
      loaded = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loaded
            ? PhotoFilterSelector(
                image: localImage,
                fit: BoxFit.contain,
                filename: basename(image.path),
                filters: presetFiltersList,
                title: null,
                loader: SpinKitDualRing(
                  size: 24,
                  color: PFColors.primary,
                ),
                circleShape: false,
              )
            : PFLoading(),
      ),
    );
  }
}
