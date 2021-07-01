import 'package:firestore_demo/controller/List_Masjid_Controller.dart';
import 'package:get/get.dart';

import '../Masjid_Controller.dart';
import '../Takmir_Controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ListMasjidController());
    // Get.put(MasjidController());
    // Get.put(TakmirController());
    Get.lazyPut(() => ListMasjidController(), fenix: true);
    Get.lazyPut(() => MasjidController(), fenix: true);
    Get.lazyPut(() => TakmirController(), fenix: true);
  }
}
