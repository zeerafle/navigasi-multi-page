import 'package:flutter/material.dart';
import 'form_page.dart';
import 'landing_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff0f8ea),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff333333)),
        ),
        drawer: Drawer(
          child: ListView(children: [
            DrawerHeader(
                child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Vauwez Sam El Fareez"),
            )),
            ListTile(
              title: Text("Keluar"),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ]),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 17),
          children: [
            Text(
              "Halo, Vauwez Sam El Fareez",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Temukan Doktermu",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: 27,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffa8c686), width: 1)),
                  hintText: "Cari dokter",
                  hintStyle: TextStyle(fontFamily: "PoppinsRegular"),
                  prefixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffa8c686)),
                  height: 90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.medication,
                          color: Colors.white,
                          size: 45,
                        ),
                        Text(
                          "Klinik",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                      color: Color(0xff9d9c62),
                      borderRadius: BorderRadius.circular(15)),
                  height: 90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.health_and_safety,
                          color: Colors.white,
                          size: 45,
                        ),
                        Text(
                          "Dokter umum",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                )),
              ],
            ),
            SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dokter Teramai",
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Color(0xffe4572e),
                      textStyle: TextStyle(
                          fontFamily: "PoppinsSemiBold", fontSize: 10)),
                  onPressed: () {},
                  child: Text("Lihat semua"),
                )
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                alignment: Alignment.center,
                height: 91,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(600),
                    child: Image.asset("assets/doctor_strange.jpg"),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Doctor Strange",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "177A Bleecker Street",
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Color(0xffa8c686)),
                          Text(
                            "07.00 - Selesai",
                            style: TextStyle(
                                fontSize: 10, fontFamily: "PoppinsMedium"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => FormPage()));
                    },
                    child: Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: Color(0xfff0f66e),
                        textStyle: TextStyle(fontSize: 10)),
                  )
                ])),
            SizedBox(
              height: 24,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                alignment: Alignment.center,
                height: 91,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(600),
                    child: Image.asset("assets/doc_brown.jpg"),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Doctor Emmet Brown",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "535 North Victory Boulevard",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Color(0xffa8c686)),
                          Text(
                            "08.00 - Selesai",
                            style: TextStyle(
                                fontSize: 10, fontFamily: "PoppinsMedium"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: Color(0xfff0f66e),
                        textStyle: TextStyle(fontSize: 10)),
                  )
                ])),
            SizedBox(
              height: 24,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                alignment: Alignment.center,
                height: 91,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(600),
                    child: Image.asset("assets/dr_john_watson.jpg"),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "dr. John Watson",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "221B Baker Street",
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Color(0xffa8c686)),
                          Text(
                            "15.00 - 21.00",
                            style: TextStyle(
                                fontSize: 10, fontFamily: "PoppinsMedium"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: Color(0xfff0f66e),
                        textStyle: TextStyle(fontSize: 10)),
                  )
                ])),
          ],
        ));
  }
}

