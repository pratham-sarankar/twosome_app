import '../../domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
  });

  factory UserModel.fromFirebaseUser(firebase.User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
    );
  }
}
