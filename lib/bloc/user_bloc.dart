import 'package:networkingplayground/model/user_response.dart';
import 'package:networkingplayground/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject =
      BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final userBloc = UserBloc();
