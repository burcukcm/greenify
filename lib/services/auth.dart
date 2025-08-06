import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> createUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return "Bilinmeyen bir hata oluştu: $e";
    }
  }

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return "Bilinmeyen bir hata oluştu: $e";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "Bu e-posta zaten kullanılıyor.";
      case 'invalid-email':
        return "Geçersiz e-posta adresi.";
      case 'operation-not-allowed':
        return "Bu işlem şu anda desteklenmiyor.";
      case 'weak-password':
        return "Şifre çok zayıf.";
      case 'user-not-found':
        return "Kullanıcı bulunamadı.";
      case 'wrong-password':
        return "Şifre hatalı.";
      default:
        return "Hata: ${e.message}";
    }
  }
}