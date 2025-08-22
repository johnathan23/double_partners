import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';

class FirebaseFireStoreService {
  late FirebaseFirestore _firebaseStorage;

  FirebaseFireStoreService() {
    _firebaseStorage = FirebaseFirestore.instance;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollection({required String collectionName}) {
    return _firebaseStorage.collection(collectionName).get().timeout(k20sec);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({required String collectionName, required String documentId}) {
    return _firebaseStorage.collection(collectionName).doc(documentId).get().timeout(k20sec);
  }

  Future<DocumentReference> addDocument({required String collectionName, required Map<String, dynamic> data}) async {
    final response = await _firebaseStorage.collection(collectionName).add(data).timeout(k20sec);
    return response;
  }

  Future<void> updateDocument({required String collectionName, required String documentId, required Map<String, dynamic> data}) {
    return _firebaseStorage.collection(collectionName).doc(documentId).update(data).timeout(k20sec);
  }

  Future<void> deleteDocument({required String collectionName, required String documentId}) {
    return _firebaseStorage.collection(collectionName).doc(documentId).delete().timeout(k20sec);
  }
}
