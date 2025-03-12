class MyUserEntity {
  String userID;
  String email;
  String name;
  bool hasActiveCard;

  MyUserEntity(
      {required this.userID,
      required this.email,
      required this.name,
      required this.hasActiveCard});

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
      'hasActiveCard': hasActiveCard
    };
  }

  static MyUserEntity fromJson(Map<String, dynamic> doc) {
    return MyUserEntity(
        userID: doc['userID'],
        email: doc['email'],
        name: doc['name'],
        hasActiveCard: doc['hasActiveCard']);
  }
}
