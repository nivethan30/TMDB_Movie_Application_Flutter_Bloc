import 'package:dio/dio.dart';
export 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  final Dio _dio = Dio();

  /// Performs a GET request to the specified [endPoint] with [headerData] as the headers.
  /// If [headerData] is not specified, it defaults to [headers].
  /// The API key is retrieved from the environment variable and appended to the [endPoint].
  /// The response is returned as a [Response].
  /// Any [DioException] that occurs is caught and passed to [_onDioException] for handling.
  /// Any other exception is rethrown.
  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? headerData}) async {
    try {
      String apiKey = dotenv.env['API_KEY']!;
      Map<String, dynamic> headers = headerData ?? this.headers();
      String url = "$endPoint$apiKey&language=en-US";
      final Response response =
          await _dio.get(url, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      _onDioException(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns an empty map of headers.
  Map<String, dynamic> headers() {
    Map<String, dynamic> headers = {};
    return headers;
  }

  /// Handles [DioException]s that occur during network operations.
  /// The exception is analyzed and a user-friendly error message is thrown.
  /// The error message is prefixed with "Connection Error: ".
  /// If the exception was caused by the connection being refused, the error message is "Connection Refused".
  /// If the exception was caused by a connection timeout, the error message is "Connection Timeout".
  /// Otherwise, the error message is the HTTP status code of the response.
  void _onDioException(DioException e) {
    if (e.response != null) {
      throw "Connection Error: ${e.response?.statusCode}";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      throw "Connection Error: Connection Timeout";
    } else {
      throw "Connection Error: Connection Refused";
    }
  }
}
