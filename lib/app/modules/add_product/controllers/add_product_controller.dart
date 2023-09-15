import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cAlamat;
  late TextEditingController cNama;
  late TextEditingController cNpm;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMahasiswa(String alamat, String nama, String npm) async {
    CollectionReference products = firestore.collection("mahasiswa_21312004");

    try {
      await products.add({
        "alamat": alamat,
        "nama": nama,
        "npm": npm,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data mahasiswa.",
          onConfirm: () {
            cAlamat.clear();
            cNama.clear();
            cNpm.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cAlamat = TextEditingController();
    cNama = TextEditingController();
    cNpm = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cAlamat.dispose();
    cNama.dispose();
    cNpm.dispose();
    super.onClose();
  }
}
