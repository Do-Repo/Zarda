import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zarda_app/models/user.dart';

class DBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserData> getUserData(String id) {
    return _firestore
        .collection("userData")
        .doc(id)
        .snapshots()
        .map((event) => UserData.fromJson(event.data()!));
  }
}
