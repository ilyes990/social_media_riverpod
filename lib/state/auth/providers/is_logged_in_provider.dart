import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_results.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_state.dart';
import 'package:social_media_clone_riverpod/state/auth/notifiers/auth_state_notifier.dart';
import 'package:social_media_clone_riverpod/state/auth/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result  == AuthResult.success;
});


