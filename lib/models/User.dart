/// 原json文件在`jsons`目录下，工具地址`https://github.com/fluttercandies/JsonToDart`

import 'dart:convert' show json;

class User {
  String loginname;
  String avatarUrl;
  String githubUsername;
  String createAt;
  int score;
  List<RecentTopic> recentTopics;
  List<RecentReplie> recentReplies;

  User({
    this.loginname,
    this.avatarUrl,
    this.githubUsername,
    this.createAt,
    this.score,
    this.recentTopics,
    this.recentReplies,
  });

  factory User.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<RecentTopic> recentTopics =
        jsonRes['recent_topics'] is List ? [] : null;
    if (recentTopics != null) {
      for (var item in jsonRes['recent_topics']) {
        if (item != null) {
          recentTopics.add(RecentTopic.fromJson(item));
        }
      }
    }

    List<RecentReplie> recentReplies =
        jsonRes['recent_replies'] is List ? [] : null;
    if (recentReplies != null) {
      for (var item in jsonRes['recent_replies']) {
        if (item != null) {
          recentReplies.add(RecentReplie.fromJson(item));
        }
      }
    }

    return User(
      loginname: jsonRes['loginname'],
      avatarUrl: jsonRes['avatar_url'],
      githubUsername: jsonRes['githubUsername'],
      createAt: jsonRes['create_at'],
      score: jsonRes['score'],
      recentTopics: recentTopics,
      recentReplies: recentReplies,
    );
  }
  Map<String, dynamic> toJson() => {
        'loginname': loginname,
        'avatar_url': avatarUrl,
        'githubUsername': githubUsername,
        'create_at': createAt,
        'score': score,
        'recent_topics': recentTopics,
        'recent_replies': recentReplies,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class RecentTopic {
  String id;
  Author author;
  String title;
  String lastReplyAt;

  RecentTopic({
    this.id,
    this.author,
    this.title,
    this.lastReplyAt,
  });

  factory RecentTopic.fromJson(jsonRes) => jsonRes == null
      ? null
      : RecentTopic(
          id: jsonRes['id'],
          author: Author.fromJson(jsonRes['author']),
          title: jsonRes['title'],
          lastReplyAt: jsonRes['last_reply_at'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'title': title,
        'last_reply_at': lastReplyAt,
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

class RecentReplie {
  String id;
  Author author;
  String title;
  String lastReplyAt;

  RecentReplie({
    this.id,
    this.author,
    this.title,
    this.lastReplyAt,
  });

  factory RecentReplie.fromJson(jsonRes) => jsonRes == null
      ? null
      : RecentReplie(
          id: jsonRes['id'],
          author: Author.fromJson(jsonRes['author']),
          title: jsonRes['title'],
          lastReplyAt: jsonRes['last_reply_at'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'title': title,
        'last_reply_at': lastReplyAt,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
