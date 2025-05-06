import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>?> getUserData(String userId) async {
  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      return {
        'username': userDoc.get('username'),
        'phoneNumber': userDoc.get('phoneNumber'),
        'fullName': userDoc.get('fullName'),
        'email': userDoc.get('email'),
        'role': userDoc.get('role'),
      };
    }
  } catch (e) {
    if (kDebugMode) {
      print("خطأ أثناء جلب البيانات: $e");
    }
  }
  return null;
}

Future<void> saveUserData(
    String username, String phoneNumber, String fullName, String role) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'id': user.uid, // معرف المستخدم الفريد
        'username': username,
        'phoneNumber': phoneNumber, // رقم الهاتف
        'fullName': fullName, // الاسم الكامل
        'email': user.email,
        'role': role, // يمكن أن يكون "admin" أو "user"
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  } catch (e) {
    print("خطأ أثناء حفظ البيانات: $e");
  }
}
