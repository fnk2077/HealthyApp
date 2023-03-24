import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GoodHealthyFirebaseUser {
  GoodHealthyFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GoodHealthyFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GoodHealthyFirebaseUser> goodHealthyFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GoodHealthyFirebaseUser>(
      (user) {
        currentUser = GoodHealthyFirebaseUser(user);
        return currentUser!;
      },
    );
