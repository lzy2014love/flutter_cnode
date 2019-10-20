// 必须是顶层函数
import 'dart:convert';

import 'package:flutter/foundation.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

// 数据量很大才用
parseJson(String text) {
  return compute(_parseAndDecode, text);
}
