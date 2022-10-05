import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class PartnershipFirebaseUser {
  PartnershipFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PartnershipFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PartnershipFirebaseUser> partnershipFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PartnershipFirebaseUser>(
      (user) {
        currentUser = PartnershipFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
