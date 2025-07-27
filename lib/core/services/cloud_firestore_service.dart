import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.doc(path);
    await reference.set(data);
  }
Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.doc(path);
    await reference.update(data);
  }
  Future<void> deleteData({required String path}) async {
    final reference = firestore.doc(path);
    await reference.delete();
  }
  Future<List<QueryDocumentSnapshot>> getData({required String path}) async {
  final reference = firestore.collection(path);
  final snapshot = await reference.get();
  return snapshot.docs;
}

Stream<List<QueryDocumentSnapshot>> streamData({required String path}) {
  final reference = firestore.collection(path);
  return reference.snapshots().map((snapshot) => snapshot.docs);
}



}