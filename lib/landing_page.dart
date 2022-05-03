import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'main_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff0f8ea),
        body: ListView(
          padding: EdgeInsets.all(17),
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Antrian Dokter Praktek Palaran",
              style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontSize: 24,
                  color: Color(0xff333333)),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 13,
                    color: Color(0xff333333)),
                children: const <TextSpan>[
                  TextSpan(
                      text:
                          "Booking antrian sekarang lebih mudah melalui handphone."),
                  TextSpan(
                      text:
                          " Antri sekarang dan datang saat nomor sudah dekat."),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 21,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) => MainPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        maximumSize: const Size(171, 47),
                        minimumSize: const Size(171, 47),
                        primary: Color(0xfff0f66e),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Lihat Dokter",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 13,
                      ),
                    ))),
            SizedBox(height: 21),
            Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Image.asset("assets/medical_staff.png"),
            )
          ],
        ));
  }
}

