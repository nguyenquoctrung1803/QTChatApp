import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/common/utils/utils.dart';
import 'package:flutter_chatapp/features/auth/screens/otp_screen.dart';
import 'package:flutter_chatapp/features/auth/screens/user_information_screen.dart';
import 'package:flutter_chatapp/mobile_screen_layout.dart';
import 'package:flutter_chatapp/models/user_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/repositories/common_firebase_stored_repositories.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  Future<UserModel?> getCurrentDatauser() async {
    var userData =
        await firestore.collection('user').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithPhoneNumber(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) {
            Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: verificationId);
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOtp(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserToFirebase({
    required BuildContext context,
    required String name,
    required File? profilePic,
    required ProviderRef ref,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStoredRepositoryProvider)
            .storeFileToFirebase('profilePic/$uid', profilePic);
      }
      var user = UserModel(
        name: name,
        profilePic: photoUrl,
        uid: uid,
        isOnline: true,
        phoneNumber: auth.currentUser!.phoneNumber!,
        groupId: [],
      );
      firestore.collection('user').doc(uid).set(user.toMap());
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MobileScreenLayout(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  Stream<UserModel> userData(String userId) {
    return firestore.collection('user').doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }
}
