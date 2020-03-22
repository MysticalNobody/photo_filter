import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_filter/res/index.dart';
import 'package:photo_filter/screens/image/index.dart';
import 'package:photo_filter/widgets/button.dart';
import './empty.i18n.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/empty_photo.svg',
          height: 200,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'No photos \n It\'s time to add them!'.i18n,
          style: PFText.caption,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 32,
        ),
        PFButton(onTap: () {
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
        })
      ],
    );
  }
}
