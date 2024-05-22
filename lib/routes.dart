import 'package:bookkeep/page/addTo_page.dart';
import 'package:bookkeep/page/base_page.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => BasePage()),
    GetPage(name: '/add', page: () => AddToPage())
  ];
}
