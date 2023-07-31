// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:adify/controller/global_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shared_pref_helper.dart';

class AuthService {
  final GlobalController globalController = Get.put(GlobalController());

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    final prefs = SharedPreferencesHelper(
      pref: await SharedPreferences.getInstance(),
    );
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final accessToken = googleAuth.accessToken;
      final refreshToken = googleAuth.idToken;

      globalController.idToken.value = refreshToken!;
      globalController.accessToken.value = accessToken!;

      log("===>id Token ===>  ${globalController.idToken.value}");
      log("===>id accessToken ===>  ${globalController.accessToken.value}");
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final user = userCredential.additionalUserInfo!.profile!["given_name"];
        globalController.username.value = user;
        prefs.setUserName(globalController.username.value);
        debugPrint("=======>    $user");
        print(user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      }
    }
    return user;
  }

  Future<User?> signOutWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final accessToken = googleAuth.accessToken;
      final refreshToken = googleAuth.idToken;

      globalController.idToken.value = refreshToken!;
      globalController.accessToken.value = accessToken!;

      log("===>id Token ===>  ${globalController.idToken.value}");
      log("===>id accessToken ===>  ${globalController.accessToken.value}");
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final user = userCredential.additionalUserInfo!.profile!["given_name"];
        globalController.username.value = user;
        debugPrint("=======>    $user");
        print(user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      }
    }
    return user;
  }

// Future signInWithGoogle() async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
//     scopes: <String>[
//       "email",
//     ],
//   ).signIn();
//   try {
//     final GoogleSignInAuthentication googleauth =
//         await googleSignInAccount!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleauth.accessToken,
//       idToken: googleauth.idToken,
//     );
//
//     final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//     final user = userCredential.additionalUserInfo!.username;
//     final accessToken = googleauth.accessToken;
//     final refreshToken = googleauth.idToken;
//
//     globalController.idToken.value = refreshToken!;
//     globalController.accessToken.value = accessToken!;
//     log("====>  accessToken  === > $accessToken");
//     log("====>  refreshToken   === > $user  ==> ");
//
//     log("====>  credential   === > ${credential}");
//
//     await auth.signInWithCredential(credential);
//   } catch (error) {
//     print("Google Sign In Error == $error");
//   }
// }
}
