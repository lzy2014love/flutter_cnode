/// 原json文件在`jsons`目录下，工具地址`https://github.com/fluttercandies/JsonToDart`

import 'dart:convert' show json;

class TopicDetail {
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
  List<Replies> replies;
  bool isCollect;

  TopicDetail({
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
    this.replies,
    this.isCollect,
  });

  factory TopicDetail.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Replies> replies = jsonRes['replies'] is List ? [] : null;
    if (replies != null) {
      for (var item in jsonRes['replies']) {
        if (item != null) {
          replies.add(Replies.fromJson(item));
        }
      }
    }

    return TopicDetail(
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
      replies: replies,
      isCollect: jsonRes['is_collect'],
    );
  }
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
        'replies': replies,
        'is_collect': isCollect,
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

class Replies {
  String id;
  Author author;
  String content;
  List<String> ups;
  String createAt;
  Object replyId;
  bool isUped;

  Replies({
    this.id,
    this.author,
    this.content,
    this.ups,
    this.createAt,
    this.replyId,
    this.isUped,
  });

  factory Replies.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<String> ups = jsonRes['ups'] is List ? [] : null;
    if (ups != null) {
      for (var item in jsonRes['ups']) {
        if (item != null) {
          ups.add(item);
        }
      }
    }

    return Replies(
      id: jsonRes['id'],
      author: Author.fromJson(jsonRes['author']),
      content: jsonRes['content'],
      ups: ups,
      createAt: jsonRes['create_at'],
      replyId: jsonRes['reply_id'],
      isUped: jsonRes['is_uped'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'content': content,
        'ups': ups,
        'create_at': createAt,
        'reply_id': replyId,
        'is_uped': isUped,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
