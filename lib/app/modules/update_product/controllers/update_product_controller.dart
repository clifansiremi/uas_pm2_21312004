import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cAlamat;
  late TextEditingController cNama;
  late TextEditingController cNpm;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef =
        firestore.collection("mahasiswa_21312004").doc(id);
    return docRef.get();
  }

  void updateProduct(String alamat, String nama, String npm, String id) async {
    DocumentReference productById =
        firestore.collection("mahasiswa_21312004").doc('id');
    try {
      await productById.update({
        "alamat": alamat,
        "nama": nama,
        "npm": npm,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data mahasiswa.",
        onConfirm: () {
          cAlamat.clear();
          cNama.clear();
          cNpm.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Data Mahasiswa.",
      );
    }
  }

  @override
  void onInit() {
    cAlamat = TextEditingController();
    cNama = TextEditingController();
    cNpm = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cAlamat.dispose();
    cNama.dispose();
    cNpm.dispose();
    super.onClose();
  }
}
