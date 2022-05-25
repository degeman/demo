import 'package:flutter/widgets.dart';

class AppStateManager extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _token = "";

  bool get isLoggedIn => _isLoggedIn;

  login(String username, String password) {
    _isLoggedIn = true;

    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
  }
}
