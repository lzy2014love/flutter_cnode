/// 原json文件在`jsons`目录下，工具地址`https://github.com/fluttercandies/JsonToDart`

import 'dart:convert' show json;

class Topic {
  String id;
  String authorId;
  String tab;
  String content;
  String title;
  String lastReplyAt;
  bool good;
  bool top;
  int replyCount;
  int visitCount;
  String createAt;
  Author author;

  Topic({
    this.id,
    this.authorId,
    this.tab,
    this.content,
    this.title,
    this.lastReplyAt,
    this.good,
    this.top,
    this.replyCount,
    this.visitCount,
    this.createAt,
    this.author,
  });

  factory Topic.fromJson(jsonRes) => jsonRes == null
      ? null
      : Topic(
          id: jsonRes['id'],
          authorId: jsonRes['author_id'],
          tab: jsonRes['tab'],
          content: jsonRes['content'],
          title: jsonRes['title'],
          lastReplyAt: jsonRes['last_reply_at'],
          good: jsonRes['good'],
          top: jsonRes['top'],
          replyCount: jsonRes['reply_count'],
          visitCount: jsonRes['visit_count'],
          createAt: jsonRes['create_at'],
          author: Author.fromJson(jsonRes['author']),
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'author_id': authorId,
        'tab': tab,
        'content': content,
        'title': title,
        'last_reply_at': lastReplyAt,
        'good': good,
        'top': top,
        'reply_count': replyCount,
        'visit_count': visitCount,
        'create_at': createAt,
        'author': author,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Author {
  String loginname;
  String avatarUrl;

  Author({
    this.loginname,
    this.avatarUrl,
  });

  factory Author.fromJson(jsonRes) => jsonRes == null
      ? null
      : Author(
          loginname: jsonRes['loginname'],
          avatarUrl: jsonRes['avatar_url'],
        );
  Map<String, dynamic> toJson() => {
        'loginname': loginname,
        'avatar_url': avatarUrl,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
