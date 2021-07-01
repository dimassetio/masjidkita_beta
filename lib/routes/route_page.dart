import 'package:firestore_demo/pages/detail_masjid.dart';
import 'package:firestore_demo/pages/masjid_page.dart';
import 'package:firestore_demo/pages/takmir_page.dart';
import 'package:get/get.dart';
import './route_name.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.list_masjid, page: () => MasjidPage()),
    GetPage(name: RouteName.masjid + '/:id', page: () => DetailMasjid()),
    GetPage(name: RouteName.takmir, page: () => TakmirPage()),
  ];
}
