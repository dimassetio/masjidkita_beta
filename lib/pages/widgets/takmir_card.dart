import 'package:firestore_demo/models/takmir_model.dart';
import 'package:firestore_demo/routes/route_name.dart';
import 'package:firestore_demo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TakmirCard extends StatelessWidget {
  final TakmirModel takmir;

  TakmirCard(this.takmir);

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
                child: Text(takmir.nama,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              Text(
                // "$age years old",
                "Jabatan : ${takmir.jabatan}",
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
                    onPressed: () {
                      // Database().getMasjid(takmir.takmirID);
                      // Get.toNamed(
                      //     RouteName.page_detail + "/${takmir.takmirID}");
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
                      Database()
                          .deleteTakmir(takmir.takmirID, Get.parameters['id']);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
