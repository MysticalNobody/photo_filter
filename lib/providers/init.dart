import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:photo_filter/utils/database.dart';
import 'package:sembast/sembast.dart';

enum InitState { loading, inited }

class InitProvider with ChangeNotifier {
  InitState state = InitState.loading;
  InitProvider() {
    start();
  }
  start() async {
    var store = stringMapStoreFactory.store("blocs");
    List<RecordSnapshot> images = await store.find(DataBase.db,
        finder: Finder(filter: Filter.byKey("images")));

    await Future.wait(<Future>[Future.delayed(Duration(seconds: 2))]);
    state = InitState.inited;
    notifyListeners();
  }
}
