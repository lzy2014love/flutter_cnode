/// 原json文件在`jsons`目录下，工具地址`https://github.com/fluttercandies/JsonToDart`

import 'dart:convert' show json;

import 'package:flutter_cnode/models/User.dart';

class Messages {
  List<Message> hasReadMessages;
  List<Message> hasnotReadMessages;

  Messages({
    this.hasReadMessages,
    this.hasnotReadMessages,
  });

  factory Messages.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Message> hasReadMessages =
        jsonRes['has_read_messages'] is List ? [] : null;
    if (hasReadMessages != null) {
      for (var item in jsonRes['has_read_messages']) {
        if (item != null) {
          hasReadMessages.add(Message.fromJson(item));
        }
      }
    }

    List<Message> hasnotReadMessages =
        jsonRes['hasnot_read_messages'] is List ? [] : null;
    if (hasnotReadMessages != null) {
      for (var item in jsonRes['hasnot_read_messages']) {
        if (item != null) {
          hasnotReadMessages.add(Message.fromJson(item));
        }
      }
    }

    return Messages(
      hasReadMessages: hasReadMessages,
      hasnotReadMessages: hasnotReadMessages,
    );
  }
  Map<String, dynamic> toJson() => {
        'has_read_messages': hasReadMessages,
        'hasnot_read_messages': hasnotReadMessages,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Message {
  String id;
  String type;
  bool hasRead;
  Author author;
  _Topic topic;
  Reply reply;

  Message({
    this.id,
    this.type,
    this.hasRead,
    this.author,
    this.topic,
    this.reply,
  });

  factory Message.fromJson(jsonRes) => jsonRes == null
      ? null
      : Message(
          id: jsonRes['id'],
          type: jsonRes['type'],
          hasRead: jsonRes['has_read'],
          author: Author.fromJson(jsonRes['author']),
          topic: _Topic.fromJson(jsonRes['topic']),
          reply: Reply.fromJson(jsonRes['reply']),
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'has_read': hasRead,
        'author': author,
        'topic': topic,
        'reply': reply,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class _Topic {
  String id;
  String title;
  String lastReplyAt;

  _Topic({
    this.id,
    this.title,
    this.lastReplyAt,
  });

  factory _Topic.fromJson(jsonRes) => jsonRes == null
      ? null
      : _Topic(
          id: jsonRes['id'],
          title: jsonRes['title'],
          lastReplyAt: jsonRes['last_reply_at'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'last_reply_at': lastReplyAt,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Reply {
  String id;
  String content;
  List<Object> ups;
  String createAt;

  Reply({
    this.id,
    this.content,
    this.ups,
    this.createAt,
  });

  factory Reply.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> ups = jsonRes['ups'] is List ? [] : null;
    if (ups != null) {
      for (var item in jsonRes['ups']) {
        if (item != null) {
          ups.add(item);
        }
      }
    }

    return Reply(
      id: jsonRes['id'],
      content: jsonRes['content'],
      ups: ups,
      createAt: jsonRes['create_at'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'ups': ups,
        'create_at': createAt,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
