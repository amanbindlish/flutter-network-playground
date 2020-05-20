import 'package:dio/dio.dart';
import 'package:networkingplayground/model/user_response.dart';
import 'package:networkingplayground/utils/logging_interceptor.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
class UserApiProvider {
  final String _endpoint = "https://randomuser.me/api/";
  Dio _dio;

  UserApiProvider() {
    BaseOptions options1 =
        BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options1);
    _dio.interceptors.add(LoggingInterceptor());
//    _dio.options.headers['content-Type'] = 'application/json';
  }

  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);

      // second case // at some later point
      _dio.options = BaseOptions();
      Response response2 = await _dio.get(_endpoint);

      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(_handleError(error));
    }
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
