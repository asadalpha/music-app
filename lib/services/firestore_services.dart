import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Service>> getServices() async {
    final snapshot = await _db.collection('music_services').get();
    return snapshot.docs.map((doc) => Service.fromMap(doc.data())).toList();
  }
}
