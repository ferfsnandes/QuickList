/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginBloc(this._firebaseAuth) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        yield LoginSuccess();
      } on FirebaseAuthException catch (e) {
        yield LoginFailure(error: e.message ?? 'An unknown error occurred');
      }
    }
  }
}
*/
