import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BiodataController extends GetxController {
  //TODO: Implement BiodataController

  var nama = ''.obs;
  var tanggalLahir = ''.obs;
  var agama = ''.obs;
  var jenisKelamin = 'Laki-laki'.obs;
  var alamat = ''.obs;
  final List<String> hobiList = [
    "Menari",
    "Membaca",
    "Bernyanyi",
    "Berenang",
    "Sepak Bola",
  ];

  var hobi = <String>[].obs;

  List<String> getHobiList() => hobiList;

  var isFormSubmitted = false.obs;
  var selectedDate = ''.obs;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate.value = formattedDate;
    }
  }

  void toggleHobi(String hobiValue) {
    if (hobi.contains(hobiValue)) {
      hobi.remove(hobiValue);
    } else {
      hobi.add(hobiValue);
    }
  }

  void submitForm() {
    print(
        '$nama, $tanggalLahir, $agama, $jenisKelamin, $alamat, ${hobi.value}');
    isFormSubmitted.value = true;
  }
}
