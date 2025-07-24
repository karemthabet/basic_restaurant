import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(path);
    await reference.doc().set(data);
  }

  Future<void> updateData({
    required String path,
    required String docuementId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).doc(docuementId).update(data);
  }

  Future<void> deleteData({
    required String path,
    required String documentId,
  }) async {
    final reference = firestore.collection(path);
    await reference.doc(documentId).delete();
  }

  Future<dynamic> getData({required String path}) async {
    var data = await firestore.collection(path).get();
    return data.docs;
  }
  Stream<dynamic> streamData({required String path}) {
    return firestore.collection(path).snapshots();
  }
}
