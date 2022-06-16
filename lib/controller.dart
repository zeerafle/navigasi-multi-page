import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GetxTextController extends GetxController {
  var nama = "".obs,
      umur = "".obs,
      alamat = "".obs,
      bpjs = "".obs,
      alergiObat = "".obs,
      keluhan = "".obs,
      dokter = "".obs,
      sisaAntrian = "".obs;

  final namaController = TextEditingController();
  final umurController = TextEditingController();
  final alamatController = TextEditingController();
  final bpjsController = TextEditingController();
  final alergiObatController = TextEditingController();
  final keluhanController = TextEditingController();

  List<Widget> listBooking = [];
}
