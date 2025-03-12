import 'models/models.dart';

 abstract class UserRepository{

    Stream<MyUser?> get user;

    Future<MyUser> signUp(MyUser myuser, String password);

    Future<void> SetUserData(MyUser user);

    Future <void> signIn(String email, String password);

    Future<void> logOut();




}