import 'package:flutter/material.dart';
import 'package:flutter_assignment_2a/models/chats.dart';
import 'package:flutter_assignment_2a/services/chats.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  ChatsService _chatsService = ChatsService();
  List<Chats> _chats = [];

  @override
  void initState() {
    super.initState();
    _chats = _chatsService.getChats();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Icon(_chats[index].icon)),
            title: Text(_chats[index].name),
            subtitle: Text(_chats[index].lastMessage),
            trailing: Text(
              _chats[index].lastMessageTime,
              style: TextStyle(color: Colors.green),
            ),
          );
        });
  }
}
