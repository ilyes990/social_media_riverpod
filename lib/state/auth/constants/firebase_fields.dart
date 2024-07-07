import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'uid';
  static const postId = 'post_id';
  static const comment = 'comment';
  static const createdAt = 'created_at';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';
  const FirebaseFieldName._();
}


/* 

column of textbuttons extract it into widget 
LoginView()

change HomePage into MainView (for when you already logged in)

column wraped with scaffold 
app bar (loginview)

and other one for mainView

call isLoggedInProvider inside MyApp()
home : Consumer(vuilder context ref child ){
  create cvar isLoggedIn that watch isLoggedIn provider
  if isLoggedIn return MainView() else return loginView 
}

inside Mainview create a button for logOut() wrrapedIt with consummer and crete builder that has ref and context and child
on press () =>  ref.read(authStateProvider.notifier).logOut(); (async await)

6:29:00


 */