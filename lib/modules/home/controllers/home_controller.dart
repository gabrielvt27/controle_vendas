import 'package:flutter/cupertino.dart';

class HomeController {
  ValueNotifier<String> pageTitle = ValueNotifier<String>("Dashboards");

  void setPageTitle(String val) => pageTitle.value = val;
}
