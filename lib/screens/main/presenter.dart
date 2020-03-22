import 'package:rxdart/rxdart.dart';

class MainPresenter {
  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(true);

  setLoading(bool value) {
    loading.add(value);
  }
}
