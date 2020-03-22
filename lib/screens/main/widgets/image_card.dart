import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key key, this.image}) : super(key: key);

  final File image;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 150,
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .8 - 48,
                  child: Text(
                    basenameWithoutExtension(image.path),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => Share.file(
                      'Ваше фото', 'Фото', image.readAsBytesSync(), 'image/*'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
