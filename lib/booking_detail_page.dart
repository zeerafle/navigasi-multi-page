import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:two_way_navigation/controller.dart';

Widget inputText(String label, TextEditingController controller) {
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
          labelText: label),
      style: const TextStyle(
        fontFamily: "PoppinsMedium",
        fontSize: 12,
      ),
    ),
  );
}

class BookingDetail extends StatelessWidget {
  BookingDetail({Key? key, required this.docId}) : super(key: key);

  final String docId;

  final GetxTextController tc = Get.put(GetxTextController());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bookingStore = firestore.collection("booking");

    Future<void> getData() async {
      DocumentSnapshot document = await bookingStore.doc(docId).get();
      tc.namaController.text = document.get("nama");
      tc.umurController.text = document.get('umur');
      tc.alamatController.text = document.get('alamat');
      tc.bpjsController.text = document.get('bpjs');
      tc.alergiObatController.text = document.get('alergiObat');
      tc.keluhanController.text = document.get('keluhan');
      tc.dokter.value = document.get('dokter');
      tc.sisaAntrian.value = document.get('sisaAntrian');
    }

    getData();

    /* tc.namaController.text = snapshot.data!.get('nama'); */
    /* tc.umurController.text = snapshot.data!.get('umur'); */
    /* tc.alamatController.text = snapshot.data!.get('alamat'); */
    /* tc.bpjsController.text = snapshot.data!.get('bpjs'); */
    /* tc.alergiObatController.text = snapshot.data!.get('alergiObat'); */
    /* tc.keluhanController.text = snapshot.data!.get('keluhan'); */

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
        const Text("Rincian Booking",
            style: TextStyle(
              fontSize: 27,
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
          "Ubah Data Diri Anda",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        inputText("Nama", tc.namaController),
        inputText("Umur", tc.umurController),
        inputText("Alamat", tc.alamatController),
        inputText("Nomor BPJS", tc.bpjsController),
        inputText("Alergi Jenis Obat", tc.alergiObatController),
        inputText("Keluhan", tc.keluhanController),
        const SizedBox(
          height: 27 - 9,
        ),
        ElevatedButton(
          onPressed: () {
            tc.nama.value = tc.namaController.text;
            tc.umur.value = tc.umurController.text;
            tc.alamat.value = tc.alamatController.text;
            tc.bpjs.value = tc.bpjsController.text;
            tc.alergiObat.value = tc.alergiObatController.text;
            tc.keluhan.value = tc.keluhanController.text;

            const mySnackBar = SnackBar(
                content: Text("Data booking diperbarui!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "PoppinsBold")),
                duration: Duration(seconds: 3),
                padding: EdgeInsets.all(10),
                backgroundColor: Color(0xffe4572e));
            ScaffoldMessenger.of(context).showSnackBar(mySnackBar);

            // UPDATE DATA
            bookingStore.doc(docId).update({
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

            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(219, 55),
            primary: const Color(0xfff0f66e),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text(
            "Perbarui Data",
            style: TextStyle(fontSize: 16, color: Color(0xff333333)),
          ),
        ),
      ]),
    );
  }
}
