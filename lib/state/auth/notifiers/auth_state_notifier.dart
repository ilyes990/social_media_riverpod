import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_clone_riverpod/state/auth/backend/authenticator.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_results.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_state.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator = Authenticator();
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        isLoading: false,
        result: AuthResult.success,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(isLoading: true);
    await _authenticator.logout();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(isLoading: true);
    final result = await _authenticator.loginWithGoogle();
    if (result == AuthResult.success && _authenticator.userId != null) {}
  }
}


/* 

cloud firestore
start in production mode 
next 

cloud firestore important 



*/
