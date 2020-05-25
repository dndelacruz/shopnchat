import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {

  final String productId;

  NewMessage(this.productId);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _message = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final _user = await FirebaseAuth.instance.currentUser();
    final _userData =
        await Firestore.instance.collection('users').document(_user.uid).get();
    Firestore.instance.collection('comments').add({
      'text': _message,
      'createdOn': Timestamp.now(),
      'userId': _user.uid,
      'userName': _userData.data['username'],
      'imageUrl': _userData.data['image_url'],
      'productId': widget.productId
    });
    _message = '';
    setState(() => _controller.text = '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              autocorrect: true,
              enableSuggestions: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (val) => setState(() => _message = val),
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: _controller.text.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
