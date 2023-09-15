import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswa_21312004 =
        firestore.collection('mahasiswa_21312004');
    return mahasiswa_21312004.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswa_21312004 =
        firestore.collection('mahasiswa_21312004');
    return mahasiswa_21312004.snapshots();
  }

  void deleteProduct(String id) {
    DocumentReference docRef =
        firestore.collection("mahasiswa_21312004").doc(id);
    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin mau menghapus data ini?",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}
