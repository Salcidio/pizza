import 'package:pizza_repository/src/entities/entities.dart';

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

  MyUserEntity toEntity() {
    return MyUserEntity(
        userID: userID, email: email, name: name, hasActiveCard: hasActiveCard);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userID: entity.userID,
        email: entity.email,
        name: entity.name,
        hasActiveCard: entity.hasActiveCard);
  }

  @override
  String toString() {
    return 'MyUser $userID $email $name $hasActiveCard';
  }
}
