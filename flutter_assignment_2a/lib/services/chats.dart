import 'package:flutter/material.dart';
import 'package:flutter_assignment_2a/models/chats.dart';

class ChatsService {
  List<Chats> getChats() {
    return List.generate(
      20,
      (index) => Chats(
        icon: Icons.person,
        name: "Contact $index",
        lastMessage: "Hello!",
        lastMessageTime: "04:50 pm",
      ),
    );
  }
}
