import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_state.dart';
import 'package:social_media_clone_riverpod/state/auth/providers/auth_state_provider.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';

final userIdProvider =
    Provider<UserId?>((ref) => ref.watch(authStateProvider).userId);
