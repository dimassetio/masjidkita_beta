import 'package:firestore_demo/controller/Masjid_Controller.dart';
import 'package:firestore_demo/services/database.dart';
import 'package:get/get.dart';
import 'package:firestore_demo/models/takmir_model.dart';

class TakmirController extends GetxController {
  RxList<TakmirModel> takmirList = RxList<TakmirModel>();

  List<TakmirModel> get takmirs => takmirList.value;
  // var mmID = 'hahahaha'.obs;

  addTakmir(String nama, String jabatan, String mID) {
    print('controller passed');

    Database().addTakmir(nama, jabatan, mID);
  }

  @override
  void onInit() {
    String mID = Get.find<MasjidController>().masjid.masjidID;
    takmirList.bindStream(Database().takmirStream(mID));
  }
}
