import 'package:firebase_auth/firebase_auth.dart';

export 'user.dart';

class MyUser {
  String userID;
  String email;
  String name;
  bool hasActiveCard;
  MyUser(
      {required this.userID,
      required this.email,
      required this.name,
      required this.hasActiveCard});

  static final empty =
      MyUser(userID: '', email: '', name: '', hasActiveCard: false);
      @override
      String toString() {
        return 'MyUser $userID $email $name $hasActiveCard';

} }
