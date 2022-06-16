import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_way_navigation/controller.dart';

Widget inputText(String label, String hint, TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          hintText: hint),
      style: const TextStyle(
        fontFamily: "PoppinsMedium",
        fontSize: 12,
      ),
    ),
  );
}

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  final GetxTextController tc = Get.put(GetxTextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f8ea),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff333333)),
      ),
      body: ListView(padding: const EdgeInsets.all(17), children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Halo, ${tc.nama.value}",
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        const Text("Silahkan tunggu giliran Anda",
            style: TextStyle(
              fontSize: 20,
            )),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 67,
              height: 67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff0f66e)),
              child: const Text(
                "12",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "pasien lagi",
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 37,
        ),
        const Text(
          "Isikan Data Diri Anda",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        inputText("Nama", "Nama lengkap", tc.namaController),
        inputText("Umur", "25", tc.umurController),
        inputText("Alamat", "Jl. Kedamaian, No. 28", tc.alamatController),
        inputText("Nomor BPJS", "00320021", tc.bpjsController),
        inputText("Alergi Jenis Obat", "sulva", tc.alergiObatController),
        inputText("Keluhan", "demam, batuk, pilek selama tiga hari",
            tc.keluhanController),
        const SizedBox(
          height: 27 - 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                tc.nama.value = tc.namaController.text;
                tc.umur.value = tc.umurController.text;
                tc.alamat.value = tc.alamatController.text;
                tc.bpjs.value = tc.bpjsController.text;
                tc.alergiObat.value = tc.alergiObatController.text;
                tc.keluhan.value = tc.keluhanController.text;

                // ADD DATA
                FirebaseFirestore.instance.collection("booking").add({
                  "nama": tc.nama.value,
                  "umur": tc.umur.value,
                  "alamat": tc.alamat.value,
                  "bpjs": tc.bpjs.value,
                  "alergiObat": tc.alergiObat.value,
                  "keluhan": tc.keluhan.value,
                });

                // kosongkan controller
                tc.namaController.text = "";
                tc.umurController.text = "";
                tc.alamatController.text = "";
                tc.bpjsController.text = "";
                tc.alergiObatController.text = "";
                tc.keluhanController.text = "";

                const mySnackBar = SnackBar(
                    content: Text("Antrian di booking!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "PoppinsBold")),
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color(0xffe4572e));
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(290, 55),
                primary: const Color(0xfff0f66e),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                "Antri Sekarang",
                style: TextStyle(fontSize: 16, color: Color(0xff333333)),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(55, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: const Color(0xff9d9c62)),
              child: const Text(
                'Batal',
                style: TextStyle(fontFamily: 'PoppinsRegular'),
              ),
            )
          ],
        )
      ]),
    );
  }
}
