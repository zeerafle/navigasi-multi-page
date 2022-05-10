import 'package:flutter/material.dart';
import 'form_page.dart';
import 'landing_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff0f8ea),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xff333333)),
        ),
        drawer: Drawer(
          child: ListView(children: [
            const DrawerHeader(
                child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Vauwez Sam El Fareez"),
            )),
            ListTile(
              title: const Text("Keluar"),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ]),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          children: [
            const Text(
              "Halo, Vauwez Sam El Fareez",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Temukan Doktermu",
              style: TextStyle(fontSize: 27),
            ),
            const SizedBox(
              height: 27,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffa8c686), width: 1)),
                  hintText: "Cari dokter",
                  hintStyle: const TextStyle(fontFamily: "PoppinsRegular"),
                  prefixIcon: const Icon(Icons.search)),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffa8c686)),
                  height: 90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xff9d9c62),
                      borderRadius: BorderRadius.circular(15)),
                  height: 90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
            const SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dokter Teramai",
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: const Color(0xffe4572e),
                      textStyle: const TextStyle(
                          fontFamily: "PoppinsSemiBold", fontSize: 10)),
                  onPressed: () {},
                  child: const Text("Lihat semua"),
                )
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
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
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Doctor Strange",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        "177A Bleecker Street",
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: const [
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
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => FormPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: const Color(0xfff0f66e),
                        textStyle: const TextStyle(fontSize: 10)),
                    child: Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                  )
                ])),
            const SizedBox(
              height: 24,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
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
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Doctor Emmet Brown",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        "535 North Victory Boulevard",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: const [
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
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: const Color(0xfff0f66e),
                        textStyle: const TextStyle(fontSize: 10)),
                    child: const Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                  )
                ])),
            const SizedBox(
              height: 24,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
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
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "dr. John Watson",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        "221B Baker Street",
                        style: TextStyle(
                            fontSize: 10, fontFamily: "PoppinsRegular"),
                      ),
                      Row(
                        children: const [
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
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    style: ElevatedButton.styleFrom(
                        //maximumSize: Size(86, 15),
                        // minimumSize: Size(86, 15),
                        primary: const Color(0xfff0f66e),
                        textStyle: const TextStyle(fontSize: 10)),
                    child: const Text(
                      "Antri",
                      style: TextStyle(color: Color(0xff333333)),
                    ),
                  )
                ])),
          ],
        ));
  }
}
