import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_clone_riverpod/state/auth/constants.dart';
import 'package:social_media_clone_riverpod/state/auth/models/auth_results.dart';
import 'package:social_media_clone_riverpod/state/posts/typedef/user_id.dart';

class Authenticator {

  
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? "";
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: [Constants.emailScope]);

    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oAuthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(oAuthCredentials);
      return AuthResult.success;
    } catch (_) {
      return AuthResult.failure;
    }
  }
}
