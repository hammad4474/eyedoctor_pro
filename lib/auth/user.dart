import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String phoneNo;

  final String username;
  final String password;

  const User({
    required this.phoneNo,
    required this.password,
    required this.username,
    required this.uid,
    required this.email,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["user"] ?? "",
      uid: snapshot["uid"] ?? "",
      email: snapshot["email"] ?? "",
      phoneNo: snapshot["phoneNo"] ?? "",
      password: snapshot["password"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "user": username,
        "uid": uid,
        "email": email,
        "password": phoneNo,
        "phoneNo": password,
      };
  User copyWith({
    String? email,
    String? uid,
    String? username,
    String? phoneNo,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      username: username ?? this.username,
      phoneNo: phoneNo ?? this.phoneNo,
      password: password ?? this.password,
    );
  }
}
