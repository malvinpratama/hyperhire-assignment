import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../utils/utils.dart';

class NetworkService {
  static final _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: Endpoints.kBaseUrl,
      connectTimeout: const Duration(minutes: 1),
      followRedirects: false,
    ),
  )..interceptors.addAll([
      if (!kDebugMode)
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printRequestHeaders: kDebugMode,
            printRequestData: kDebugMode,
            printResponseHeaders: kDebugMode,
            printResponseMessage: kDebugMode,
            printResponseData: kDebugMode,
            // Blue http requests logs in console
            requestPen: AnsiPen()..blue(),
            // Green http responses logs in console
            responsePen: AnsiPen()..green(),
            // Error http logs in console
            errorPen: AnsiPen()..red(),
          ),
        ),
    ]);

  static Dio get client {
    // if (kIsWeb) {
    //   _client.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
    // }
    return _client;
  }

  static Map<String, dynamic> setupTokenHeader({String? token}) {
    final headers = <String, dynamic>{
      if (token != null) 'Authorization': token,
    };
    return headers;
  }

  static Options setupNetworkOptions(String? token, {Options? otherOptions}) {
    if (otherOptions != null) {
      otherOptions.headers = setupTokenHeader(token: token);
      return otherOptions;
    } else {
      return Options(headers: setupTokenHeader(token: token));
    }
  }
}
