import 'package:cloud_firestore/cloud_firestore.dart';

class TakmirModel {
  String nama;
  String jabatan;
  String takmirID;
  // Timestamp dateCreated;

  TakmirModel({
    this.nama,
    this.jabatan,
  });

  TakmirModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    takmirID = documentSnapshot.id;
    nama = documentSnapshot.data()["nama"];
    jabatan = documentSnapshot.data()["jabatan"];
  }
}
