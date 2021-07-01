import 'package:firestore_demo/controller/Masjid_Controller.dart';
import 'package:firestore_demo/controller/Takmir_Controller.dart';
import 'package:firestore_demo/models/list_masjid_model.dart';
import 'package:firestore_demo/routes/route_name.dart';
import 'package:firestore_demo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MasjidCard extends StatelessWidget {
  final ListMasjidModel masjid;

  //// Pointer to Update Function
  final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;
  final Function onView;

  MasjidCard(this.masjid, {this.onUpdate, this.onDelete, this.onView});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue[900])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(masjid.nama,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              Text(
                // "$age years old",
                "Kota : ${masjid.kota}",
                style: GoogleFonts.poppins(),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.green[900],
                    child: Center(
                        child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.white,
                    )),
                    onPressed: () async {
                      // Database().getMasjid(masjid.masjidID);
                      Get.find<MasjidController>().getMasjid(masjid.masjidID);
                      Get.toNamed(RouteName.masjid + "/${masjid.masjidID}");
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.red[900],
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      Database().deleteMasjid(masjid.masjidID);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
