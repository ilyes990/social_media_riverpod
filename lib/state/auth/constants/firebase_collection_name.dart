import 'package:flutter/foundation.dart' show immutable;
import 'package:social_media_clone_riverpod/state/auth/constants/firebase_fields.dart';

@immutable 
class FirebaseCollectionName {
  static const thumbnail = 'thumbnails';
  static const comments = 'comments';
  static const likes = 'likes';
  static const posts = 'posts';
  static const users = 'users';
  const FirebaseCollectionName._();
}