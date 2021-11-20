import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth;

  Stream<User?> get authStateChanges => _auth.idTokenChanges();
  AuthService(this._auth);

  Future<UserCredential?> signIn(String email, String password) async{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createAccount(String email, String password) async{
     return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  User? get currentUser => _auth.currentUser;

  Future<void> signOut() async{
    await _auth.signOut();
}

  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}