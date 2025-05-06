import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model.dart';

class UserRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  UserRepository({required this.firestore, required this.auth});

  Future<void> saveUser(UserEntity user) async {
    try {
      await firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      print("خطأ أثناء حفظ المستخدم: $e");
    }
  }

  Future<UserEntity?> getUser(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return UserEntity.fromMap(userDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("خطأ أثناء جلب المستخدم: $e");
    }
    return null;
  }
}
