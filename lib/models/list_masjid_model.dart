import 'package:cloud_firestore/cloud_firestore.dart';

class ListMasjidModel {
  String nama;
  String kota;
  String masjidID;
  // Timestamp dateCreated;

  ListMasjidModel({
    this.nama,
    this.kota,
  });

  ListMasjidModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    masjidID = documentSnapshot.id;
    nama = documentSnapshot.data()["nama"];
    kota = documentSnapshot.data()["kota"];
  }
}
