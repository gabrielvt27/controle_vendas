import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  _getMeliToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');
  }

  ValueNotifier<String> pageTitle = ValueNotifier<String>("Dashboards");

  void setPageTitle(String val) => pageTitle.value = val;
}
