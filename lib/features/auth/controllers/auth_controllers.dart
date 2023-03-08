// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_chatapp/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhoneNumber(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOtp) {
    authRepository.verifyOtp(
      context: context,
      verificationId: verificationId,
      userOTP: userOtp,
    );
  }

  void saveuserToFirebase(BuildContext context, String name, File? profilePic) {
    authRepository.saveUserToFirebase(
        context: context, name: name, profilePic: profilePic, ref: ref);
  }
}
