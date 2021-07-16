// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  //const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/QxGAMiWEYgmOiH1vzJoW/messages/')
            .snapshots(),
        builder: (ctx, streamSnapShots) {
          if (streamSnapShots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final docs = streamSnapShots.data.documents;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(5),
              child: Text(docs[index]['Text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Firestore.instance
                .collection('chats/QxGAMiWEYgmOiH1vzJoW/messages')
                .add({'Text': 'New Text added'});
          }),
    );
  }
}
