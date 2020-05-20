import 'package:networkingplayground/model/user.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
class UserResponse {
  final List<User> results;
  final String error;

  UserResponse(this.results, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : results =
            (json["results"] as List).map((i) => new User.fromJson(i)).toList(),
        error = "";

  UserResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
