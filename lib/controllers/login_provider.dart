import 'package:ecom/controllers/base_provider.dart';
import 'package:ecom/controllers/base_provider_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/exception.dart';

class LoginRequestModel {
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
}

class LoginProvider extends BaseProvider {
  final BaseProviderModel<LoginRequestModel> _loginData =
      BaseProviderModel.init(data: LoginRequestModel());

  LoginRequestModel get loginInstance => _loginData.data!;

  final loginFormKey = GlobalKey<FormState>();

  final forgetfForm = GlobalKey<FormState>();

  bool isPop = false;
  bool isCancel = false;
  bool isPassword = true;
  bool isVarified = false;
  bool isFirstTimeCheck = true;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future loginbyGoogle() async {
    try {
      isCancel = false;
      isPop = false;
      setStatus(ViewState.loading, notify: true);
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        setStatus(ViewState.fail, notify: true);
        setErrorMessage('Google account is not exist', notify: true);
        return;
      } else {
        _user = googleUser;
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
      setStatus(ViewState.done, notify: true);
    } on PlatformException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.message!, notify: true);
    } on FirebaseAuthException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.code, notify: true);
    } on RemoteException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.errorMessage, notify: true);
    } finally {}
  }

  Future logoutGoogle() async {
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
    }
    await FirebaseAuth.instance.signOut();
    setStatus(ViewState.none);
    notifyListeners();
  }

  Future loginbyEmail() async {
    try {
      isCancel = false;
      isPop = false;
      setStatus(ViewState.loading, notify: true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginInstance.loginEmail.text,
        password: loginInstance.loginPassword.text,
      );
      setStatus(ViewState.done, notify: true);
    } on PlatformException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.message!, notify: true);
    } on FirebaseAuthException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.code, notify: true);
    } on RemoteException catch (exception) {
      setStatus(ViewState.fail, notify: true);
      setErrorMessage(exception.errorMessage, notify: true);
    } finally {}
  }
}
