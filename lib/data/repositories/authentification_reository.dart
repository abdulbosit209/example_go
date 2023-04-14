import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gotaxi/data/local_storage/cache.dart';
import 'package:gotaxi/data/local_storage/local_storage.dart';
import 'package:gotaxi/data/models/user_model.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  static const userCacheKey = '__user_cache_key__';

  static String? _verificationId = "";

  Future<void> signUpWithPhoneNumber({
    required String number,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted:
          (firebase_auth.PhoneAuthCredential credential) async {
        await firebase_auth.FirebaseAuth.instance
            .signInWithCredential(credential);
      },
      verificationFailed: (firebase_auth.FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        StorageRepository.putBool("codeSent", true);
        debugPrint(
            'VERIFICATION ID: <<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>> shiitttttt is it nulllll $_verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('errror codeRetrievalAutoTimeOut $verificationId');
      },
    );
  }

  Future<void> otpVerification({
    required String code,
  }) async {
    try {
      firebase_auth.PhoneAuthCredential credential =
          firebase_auth.PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: code,
      );
      (await firebase_auth.FirebaseAuth.instance
              .signInWithCredential(credential))
          .user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint("wrong otp: ${e.message}");
    }
  }

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
        id: uid, phone: phoneNumber, name: displayName, photo: photoURL);
  }
}

class LogOutFailure implements Exception {}
