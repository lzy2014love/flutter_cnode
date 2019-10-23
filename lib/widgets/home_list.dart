import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cnode/models/topic.dart';
import 'package:flutter_cnode/widgets/imageHelper.dart';

class HomeList extends StatelessWidget {
  final Topic topic;
  HomeList(this.topic);
  String get tabText {
    return topic.top ? '置顶' : topic.tab;
  }

  Color get tabBgColor {
    return topic.top ? Colors.green : Colors.grey;
  }

  Color get tabColor {
    return topic.top ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: const BorderSide(width: 1, color: Colors.black))),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              print(122);
            },
            child: Container(
              // constraints: BoxConstraints(minHeight: 150, maxHeight: 200),
              decoration: BoxDecoration(
                  border: Border(
                bottom: const BorderSide(width: 1, color: Colors.black),
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildListTop(context),
                  Text(
                    '${topic.title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: topic.author.avatarUrl,
                        width: 12,
                        height: 12,
                        placeholder: ImageHelper.placeHolderImageBuilder(
                            ImageHelper.placeHolderImage(width: 12)),
                        errorWidget: ImageHelper.errorImageBuilder(
                            ImageHelper.errorImage(width: 12)),
                        fit: BoxFit.cover,
                      ),
                      Divider(
                        indent: 4,
                        height: 20,
                      ),
                      Text(
                        '${topic.author.loginname}',
                        style: TextStyle(),
                      )
                    ],
                  ),
                  Text('创建于：${topic.createAt}')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildListTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: tabBgColor,
          ),
          child: Text(
            tabText,
            style: TextStyle(color: tabColor),
          ),
        ),
        RichText(
          text: TextSpan(
              text: topic.replyCount.toString(),
              style: TextStyle(color: Colors.green),
              children: [
                TextSpan(
                    text: '/${topic.visitCount}-${topic.lastReplyAt}',
                    style: DefaultTextStyle.of(context).style)
              ]),
        )
      ],
    );
  }
}
