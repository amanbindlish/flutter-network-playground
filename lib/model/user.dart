import 'package:networkingplayground/model/name.dart';
import 'package:networkingplayground/model/picture.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
class User {
  final String gender;
  final Name name;
  final String email;
  final Picture picture;

  User(this.gender, this.name, this.email, this.picture);

  User.fromJson(Map<String, dynamic> json)
      : gender = json["gender"],
        name = Name.fromJson(json["name"]),
        email = json["email"],
        picture = Picture.fromJson(json["picture"]);
}
