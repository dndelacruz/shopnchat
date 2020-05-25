import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isMe, this.userName, this.imageUrl,
      {this.key});
  final String message;
  final bool isMe;
  final String userName;
  final String imageUrl;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 180,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12),
                  ),
                  color:
                      isMe ? Colors.grey[300] : Theme.of(context).accentColor),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   userName,
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       color: isMe
                  //           ? Colors.black
                  //           : Theme.of(context)
                  //               .accentTextTheme
                  //               .headline1
                  //               .color),
                  // ),
                  Text(
                    message,
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : Theme.of(context)
                                .accentTextTheme
                                .headline1
                                .color),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 165,
          right: isMe ? 165 : null,
          child: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
          ),
      ],
      overflow: Overflow.visible,
    );
  }
}
