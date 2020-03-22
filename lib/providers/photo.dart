import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:photo_filter/utils/database.dart';
import 'package:sembast/sembast.dart';

class PhotoProvider with ChangeNotifier {
  static final PhotoProvider _singleton = PhotoProvider._internal();
  PhotoProvider._internal();
  factory PhotoProvider() => _singleton;

  List<File> images = [];
  Set<String> pathImages = <String>{};

  start() async {
    images = [];
    pathImages = <String>{};
    notifyListeners();
    var store = stringMapStoreFactory.store("blocs");
    List<RecordSnapshot> _ = await store.find(DataBase.db,
        finder: Finder(filter: Filter.byKey("images")));
    try {
      pathImages.addAll([..._.first['filtered']]);
      pathImages.forEach((path) {
        images.add(File(path));
      });
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  save(var filtered) {
    pathImages.add(filtered);
    var store = stringMapStoreFactory.store("blocs");
    store.record("images").put(
      DataBase.db,
      {"filtered": pathImages},
    ).then((value) => start());
  }
}
