import 'package:networkingplayground/apiproviders/user_api_provider.dart';
import 'package:networkingplayground/model/user_response.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser() {
    return _apiProvider.getUser();
  }
}
