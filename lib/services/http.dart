import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cnode/constants/app_config.dart';
import 'package:flutter_cnode/models/result_dto.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

// 数据量很大才用
parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class Http extends DioForNative {
  Http([BaseOptions options]) : super(options) {
    interceptors..add();
    init();
  }
  @protected
  void init();
}

class _Http {
  static final _options = BaseOptions(
    baseUrl: 'https://cnodejs.org/api/v1',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  final dio = Dio(_options);

  _Http() {
    if (!AppConfig.isProducttion) {
      dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    }
  }

  Future<ResultDto> request(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    bool showToast = false,
  }) async {
    dio.get('',
        options: Options(
          extra: {'showToast': showToast},
        ));
  }
}
