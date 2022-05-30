import 'package:flutter/material.dart';

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

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var nama = "",
      umur = "",
      alamat = "",
      bpjs = "",
      alergiObat = "",
      keluhan = "";

  TextEditingController namaController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController bpjsController = TextEditingController();
  TextEditingController alergiObatController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f8ea),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff333333)),
      ),
      body: ListView(padding: EdgeInsets.all(17), children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Halo, $nama",
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        if (nama != "")
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              "$umur tahun - $alamat - $bpjs\nAlergi pada $alergiObat - $keluhan",
              style: const TextStyle(
                fontSize: 13,
              ),
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
        inputText("Nama", "Nama lengkap", namaController),
        inputText("Umur", "25", umurController),
        inputText("Alamat", "Jl. Kedamaian, No. 28", alamatController),
        inputText("Nomor BPJS", "00320021", bpjsController),
        inputText("Alergi Jenis Obat", "sulva", alergiObatController),
        inputText("Keluhan", "demam, batuk, pilek selama tiga hari",
            keluhanController),
        const SizedBox(
          height: 27 - 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = namaController.text;
                  umur = umurController.text;
                  alamat = alamatController.text;
                  bpjs = bpjsController.text;
                  alergiObat = alergiObatController.text;
                  keluhan = keluhanController.text;

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
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(290, 55),
                primary: Color(0xfff0f66e),
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
                  minimumSize: Size(55, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Color(0xff9d9c62)),
              child: Text(
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
