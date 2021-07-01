import 'package:get/get.dart';
import 'package:firestore_demo/models/list_masjid_model.dart';
import 'package:firestore_demo/services/database.dart';

class ListMasjidController extends GetxController {
  RxList<ListMasjidModel> masjidList = RxList<ListMasjidModel>();

  List<ListMasjidModel> get masjids => masjidList.value;

  @override
  void onInit() {
    masjidList.bindStream(Database().masjidStream());
  }
}
