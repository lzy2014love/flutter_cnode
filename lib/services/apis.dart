import 'package:flutter_cnode/constants/enum.dart';
import 'package:flutter_cnode/models/User.dart';
import 'package:flutter_cnode/models/messages.dart';
import 'package:flutter_cnode/models/topic.dart';
import 'package:flutter_cnode/models/topic_detail.dart';
import 'package:flutter_cnode/services/http.dart';

/// api地址`https://cnodejs.org/api`
/// 主题首页
Future<List<Topic>> getTopics(
    {int page, Tab tab, int limit, bool mdrender = true}) async {
  return GET('/topics').data;
}

/// 主题详情
Future<TopicDetail> getTopic(String id,
    {String accesstoken, bool mdrender = true}) async {
  return GET('/topics/$id').data;
}

/// 收藏主题
Future<void> collectTopic(
  String accesstoken,
  String topicId,
) async {
  POST('/topic_collect/collect');
}

/// 取消主题
Future<void> decollectTopic(
  String accesstoken,
  String topicId,
) async {
  POST('/topic_collect/collect');
}

/// 用户所收藏的主题
Future<List<Topic>> getTopicCollect(String loginname) async {
  return GET('/topic_collect/$loginname').data;
}

/// 用户详情
Future<User> getUser(String loginname) async {
  return GET('/user/$loginname').data;
}

/// 验证 accessToken 的正确性
Future<void> login(
  String accesstoken,
) async {
  POST('/accesstoken');
}

/// 获取未读消息数
Future<int> getUnreadMsgNum(String accesstoken) async {
  return GET('/message/count').data;
}

/// 获取已读和未读消息
Future<Messages> getMessages(String accesstoken, {bool mdrender = true}) async {
  return GET('/messages').data;
}

/// 标记全部已读
Future<void> readAllMessages(
  String accesstoken,
) async {
  POST('/message/mark_all');
}

/// 标记单个消息为已读
Future<void> readMessage(
  String msgId,
  String accesstoken,
) async {
  POST('/message/mark_one/$msgId');
}
