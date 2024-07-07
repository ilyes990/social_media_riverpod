import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_clone_riverpod/state/auth/constants/firebase_collection_name.dart';
import 'package:social_media_clone_riverpod/state/auth/constants/firebase_fields.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';
import 'package:social_media_clone_riverpod/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  UserInfoStorage();

  Future<bool> saveuserInfo(
      {required UserId userid,
      required String displayName,
      required String? email}) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userid)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        // we already have this user's info  6:02:00

        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email
        });
        return true;
      }

      // we don't have this user's info from before , create new user

      final payload = UserInfoPayload(
          userid: userid, displayName: displayName, email: email);
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payload);

      return true;
    } catch (_) {
      return false;
    }
  }
}
