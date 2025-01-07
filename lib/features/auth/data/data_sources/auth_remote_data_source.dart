import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signInWithEmail(String email, String password);

  Future<User?> signUpWithEmail(String email, String password);

  Future<User?> signInWithGoogle();

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  User? getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.googleSignIn);

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  @override
  Future<User?> signUpWithEmail(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result = await firebaseAuth.signInWithCredential(credential);
    return result.user;
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() => firebaseAuth.currentUser;

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
