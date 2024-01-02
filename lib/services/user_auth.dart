import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //register
  Future<User?> register(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  //login
  Future<User?> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
