import 'package:firestore_demo/models/masjid_model.dart';
import 'package:firestore_demo/models/takmir_model.dart';
import 'package:firestore_demo/services/database.dart';
import 'package:get/get.dart';

class MasjidController extends GetxController {
  Rx<MasjidModel> _masjidModel = MasjidModel().obs;

  RxList<TakmirModel> takmirList = RxList<TakmirModel>();
  List<TakmirModel> get takmirs => takmirList.value;

  MasjidModel get masjid => _masjidModel.value;

  set masjid(MasjidModel value) => this._masjidModel.value = value;

  void getMasjid(mID) async {
    masjid = await Database().getMasjid(mID);
    takmirList.bindStream(Database().takmirStream(mID));
  }

  void clear() {
    _masjidModel.value = MasjidModel();
  }
}
