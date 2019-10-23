import 'package:bot_toast/bot_toast.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cnode/constants/app_config.dart';
import 'package:flutter_cnode/models/result_dto.dart';
import 'package:flutter_cnode/utils/global.dart';

class Method {
  Method._();
  static const GET = 'GET';
  static const POST = 'POST';
}

class _Http {
  static final _options = BaseOptions(
    baseUrl: 'https://cnodejs.org/api/v1',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Options checkOptions(String method, Options options) {
    if (options == null) {
      options = Options();
    }
    options.method = method;
    return options;
  }

  final _dio = Dio(_options);

  _Http() {
    // 开发模式
    if (!AppConfig.isProducttion) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        // client.findProxy = (uri) {
        //   //proxy all request to localhost:8888
        //   return "PROXY localhost:8888";
        // };
        // 不校验证书
        client.badCertificateCallback = (cert, host, port) => true;
      };
      _dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
    }
  }

  Future<ResultDto<T>> request<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    bool showLoading = false,
    bool showErrorToast = true,
    bool needAccesstoken = false,
  }) async {
    CancelFunc cancelFunc;
    if (showLoading) {
      cancelFunc = BotToast.showLoading();
    }
    try {
      final response = await _dio.request<Map<String, dynamic>>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return ResultDto.fromJson(response.data);
    } on DioError catch (e) {
      if (showErrorToast) {
        BotToast.showText(text: e.message);
      }
      rethrow;
    } finally {
      cancelFunc?.call();
    }
  }
}

final http = _Http();
// ignore: non_constant_identifier_names
Future<ResultDto<T>> GET<T>(
  String path, {
  Map<String, dynamic> queryParameters,
  Options options,
  CancelToken cancelToken,
  ProgressCallback onSendProgress,
  ProgressCallback onReceiveProgress,
  bool showLoading = false,
  bool showErrorToast = true,
  bool needAccesstoken = false,
}) {
  if (needAccesstoken) {
    queryParameters['accesstoken'] = Global.accesstoken;
  }
  return http.request<T>(
    path,
    queryParameters: queryParameters,
    options: _Http.checkOptions(Method.GET, options),
    cancelToken: cancelToken,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
    showLoading: showLoading,
    showErrorToast: showErrorToast,
    needAccesstoken: needAccesstoken,
  );
}

// ignore: non_constant_identifier_names
Future<ResultDto<T>> POST<T>(
  String path, {
  Map<String, dynamic> data,
  Map<String, dynamic> queryParameters,
  Options options,
  CancelToken cancelToken,
  ProgressCallback onSendProgress,
  ProgressCallback onReceiveProgress,
  bool showLoading = false,
  bool showErrorToast = true,
  bool needAccesstoken = false,
}) {
  if (needAccesstoken) {
    data['accesstoken'] = Global.accesstoken;
  }
  return http.request<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: _Http.checkOptions(Method.POST, options),
    cancelToken: cancelToken,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
    showLoading: showLoading,
    showErrorToast: showErrorToast,
    needAccesstoken: needAccesstoken,
  );
}
