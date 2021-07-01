import 'package:firestore_demo/controller/Masjid_Controller.dart';
import 'package:firestore_demo/controller/Takmir_Controller.dart';
import 'package:firestore_demo/pages/widgets/takmir_card.dart';
import 'package:firestore_demo/routes/route_name.dart';
import 'package:firestore_demo/services/database.dart';
import 'package:firestore_demo/pages/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/nav_drawer.dart';

class DetailMasjid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MasjidController masjidC = Get.find();
    // final takmirC = Get.find<TakmirController>();
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Jajal Firestore'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          // color: Colors.white38,
          child: Obx(
            () => masjidC.masjid.nama == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        height: 200,
                        color: Colors.blue[700],
                        child: Text(
                          "Gambar Masjid",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(masjidC.masjid.nama,
                            style: GoogleFonts.poppins(fontSize: 18)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(masjidC.masjid.kota,
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black54)),
                      ),
                      Divider(color: Colors.black45),
                      Desc_box(),
                      Divider(color: Colors.black45),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RouteName.takmir +
                                "/${masjidC.masjid.masjidID}");
                          },
                          child: Text(
                            "Takmir",
                            style: TextStyle(fontSize: 20),
                          )),
                      Divider(color: Colors.black45),
                      Obx(
                        () => masjidC.takmirs.isEmpty
                            ? Center(child: Text("Belum ada Takmir"))
                            : Column(
                                // scrollDirection: Axis.vertical,
                                children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: masjidC.takmirs.length,
                                        itemBuilder: (_, index) {
                                          var item = masjidC.takmirs[index];
                                          return TakmirCard(item);
                                          // return TakmirCard(takmirController.takmirs[index]);
                                        }),
                                  ]),
                      ),
                    ],
                  ),
          ),
        ));
  }
}

class Desc_box extends StatelessWidget {
  const Desc_box({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          Text(
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi eligendi ipsam blanditiis dicta quos unde, aut consequuntur corporis, voluptas vel hic mollitia quo odio veniam similique. Sint culpa assumenda dolores!",
          )
        ],
      ),
    );
  }
}
