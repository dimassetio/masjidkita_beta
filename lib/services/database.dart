import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firestore_demo/models/list_masjid_model.dart';
import 'package:firestore_demo/models/masjid_model.dart';
import 'package:firestore_demo/models/takmir_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMasjid(String nama, String kota) async {
    DateTime now = DateTime.now();
    try {
      await _firestore.collection("masjid").add({
        'nama': nama,
        'kota': kota,
        'createdAt': now,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTakmir(String nama, String jabatan, String mID) async {
    DateTime now = DateTime.now();
    try {
      await _firestore.collection("masjid").doc(mID).collection("takmir").add({
        'nama': nama,
        'jabatan': jabatan,
        'createdAt': now,
      });
      print('db passed');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<ListMasjidModel>> masjidStream() {
    return _firestore
        .collection("masjid")
        .snapshots()
        .map((QuerySnapshot query) {
      List<ListMasjidModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ListMasjidModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<TakmirModel>> takmirStream(String mID) {
    return _firestore
        .collection("masjid")
        .doc(mID)
        .collection("takmir")
        .orderBy("createdAt")
        .snapshots()
        .map((QuerySnapshot query) {
      List<TakmirModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(TakmirModel.fromDocumentSnapshot(element));
      });
      print(mID);
      return retVal;
    });
  }

  deleteMasjid(mID) {
    _firestore.collection("masjid").doc(mID).delete();
  }

  deleteTakmir(tID, mID) {
    _firestore
        .collection("masjid")
        .doc(mID)
        .collection("takmir")
        .doc(tID)
        .delete();
  }

  Future<MasjidModel> getMasjid(String mID) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("masjid").doc(mID).get();
      return MasjidModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
    }
  }
}
