import 'package:flutter/material.dart';

class Chats {
  final IconData icon;
  final String name;
  final String lastMessage;
  final String lastMessageTime;

  const Chats({
    required this.icon,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory Chats.fromData(Map<String, dynamic> data) {
    return Chats(
      icon: data['icon'] as IconData,
      name: data['name'],
      lastMessage: data['lastMessage'],
      lastMessageTime: data['lastMessageTime'],
    );
  }
}
