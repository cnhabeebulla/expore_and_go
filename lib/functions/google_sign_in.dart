import 'package:explore_and_go_application/functions/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignInMethod extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    dynamic credential;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    } on Exception catch (e) {
      // TODO
      showMyDialog(e.toString(), context);
      rethrow;
    }
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      showMyDialog("firabse error ${e.toString()}", context);
      rethrow;
    }
    notifyListeners();
  }

  Future<void> googleLogout() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}

void signUpWithGoogleAccount(BuildContext context) {
    try {
      final provider = Provider.of<GoogleSignInMethod>(context, listen: false);
      provider.googleLogin(context);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }