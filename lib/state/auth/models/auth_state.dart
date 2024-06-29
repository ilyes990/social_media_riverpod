// ignore_for_file: must_be_immutable

import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_results.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool? isLoading;
  final UserId? userId;

  const AuthState(
      {required this.result, required this.isLoading, required this.userId});

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userId = null;

  AuthState copiedWithIsLoading({bool? isLoading}) {
    return AuthState(result: result, isLoading: isLoading, userId: userId);
  }

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(result, isLoading, userId);
}
