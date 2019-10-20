import 'package:flutter_cnode/models/User.dart';
import 'package:flutter_cnode/models/messages.dart';
import 'package:flutter_cnode/models/topic.dart';
import 'package:flutter_cnode/models/topic_detail.dart';
import 'package:flutter_cnode/services/http.dart';

/// api地址`https://cnodejs.org/api`
/// 主题首页
Future<List<Topic>> getTopics(
    {int page, String tab, int limit, bool mdrender = true}) async {
  final resultDto = await GET('/topics', queryParameters: {
    'page': page,
    'tab': tab,
    'limit': limit,
    'mdrender': mdrender.toString()
  });
  return resultDto.data;
}

/// 主题详情
Future<TopicDetail> getTopic(String id,
    {bool needAccesstoken = false, bool mdrender = true}) async {
  final resultDto = await GET('/topics/$id',
      queryParameters: {'mdrender': mdrender.toString()},
      needAccesstoken: needAccesstoken);
  return resultDto.data;
}

/// 收藏主题
Future<void> collectTopic(
  String topicId,
) async {
  POST('/topic_collect/collect',
      data: {'topicId': topicId}, needAccesstoken: true);
}

/// 取消主题
Future<void> decollectTopic(
  String topicId,
) async {
  POST('/topic_collect/collect',
      data: {'topicId': topicId}, needAccesstoken: true);
}

/// 用户所收藏的主题
Future<List<Topic>> getTopicCollect(String loginname) async {
  final resultDto = await GET('/topic_collect/$loginname');
  return resultDto.data;
}

/// 用户详情
Future<User> getUser(String loginname) async {
  final resultDto = await GET('/user/$loginname');
  return resultDto.data;
}

/// 验证 accessToken 的正确性
Future<void> login() async {
  POST('/accesstoken', needAccesstoken: true);
}

/// 获取未读消息数
Future<int> getUnreadMsgNum() async {
  final resultDto = await GET('/message/count', needAccesstoken: true);
  return resultDto.data;
}

/// 获取已读和未读消息
Future<Messages> getMessages({bool mdrender = true}) async {
  final resultDto = await GET('/messages', needAccesstoken: true);
  return resultDto.data;
}

/// 标记全部已读
Future<void> readAllMessages() async {
  POST('/message/mark_all', needAccesstoken: true);
}

/// 标记单个消息为已读
Future<void> readMessage(
  String msgId,
) async {
  POST('/message/mark_one/$msgId', needAccesstoken: true);
}
