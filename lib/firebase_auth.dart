import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<Map> signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  assert(!user!.isAnonymous);
  assert(await user!.getIdToken() != null);

  final User? currentUser = _auth.currentUser;
  assert(user!.uid == currentUser!.uid);
  var userDetails = {
    "id": user!.uid,
    "name": user.displayName,
    "email": user.email,
    "image": user.photoURL,
    "lastSignin": user.metadata.lastSignInTime,
    "createdate": user.metadata.creationTime,
    "token": await user.getIdToken().then((value) => value)
  };

  return userDetails;
}

Future<Map> signInWithEmail(String email, String password) async {
  final authResult =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  final User? user = authResult.user;

  assert(user != null);
  assert(await user!.getIdToken() != null);
  final User? currentUser = _auth.currentUser;
  assert(user!.uid == currentUser!.uid);

  var userDetails = {
    "id": user!.uid,
    "name": user.displayName,
    "email": user.email,
    "image": user.photoURL,
    "lastSignin": user.metadata.lastSignInTime,
    "createdate": user.metadata.creationTime,
    "token": await user.getIdToken().then((value) => value)
  };

  return userDetails;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
}
