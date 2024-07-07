import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_clone_riverpod/state/auth/constants/firebase_fields.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload(
      {required UserId userid,
      required String? displayName,
      required String? email})
      : super({
          FirebaseFieldName.userId: userid,
          FirebaseFieldName.displayName: displayName ?? "",
          FirebaseFieldName.email: email ?? ""
        });
}
