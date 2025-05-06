import 'package:firebase_auth/firebase_auth.dart';

import '../../../../auth/sign_screen/sign_states.dart';

Future<void> fetchUserDetails() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic>? userData = await getUserData(userId);
}
