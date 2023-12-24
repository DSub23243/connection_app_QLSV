import 'package:connection/models/profile.dart';
import 'package:connection/providers/loginviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  static final MainViewModel _instance = MainViewModel._internal();
  MainViewModel._internal();
  factory MainViewModel() {
    return _instance;
  }
  int menustatus = 0;
  int activemenu = 0;
  void togglemenu() {
    if (menustatus == 0) {
      menustatus = 1;
    } else {
      menustatus = 0;
    }
    notifyListeners();
  }

  void CloseMenu() {
    menustatus = 0;
    notifyListeners();
  }

  void setActiveMenu(int index) {
    activemenu = index;
    menustatus = 0;
    notifyListeners();
  }

  void logOut() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Profile().initialize();
      loginViewModel().status = 0;
      notifyListeners();
    });
  }
}
