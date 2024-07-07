import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_state.dart';
import 'package:social_media_clone_riverpod/state/auth/notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
