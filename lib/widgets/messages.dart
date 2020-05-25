import '../widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  final String productId;

  Messages(this.productId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (_, usnapshot) {
        if (usnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return StreamBuilder(
            stream: Firestore.instance
                .collection('comments')
                .orderBy('createdOn', descending: true)
                .where('productId', isEqualTo: productId)
                .snapshots(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              final chats = snapshot.data.documents;
              print(chats.length);
              if(chats.length > 0)  
              return ListView.builder(
                reverse: true,
                itemCount: chats.length,
                itemBuilder: (_, index) => MessageBubble(chats[index]['text'],
                    chats[index]['userId'] == usnapshot.data.uid,
                    chats[index]['userName'],
                    chats[index]['imageUrl'],
                    key: ValueKey(chats[index].documentID)
                    ),
              );
              else
               return Center(child: Text('No comments available at this time. Send one below.'),);
            },
          );
        }
      },
    );
  }
}
