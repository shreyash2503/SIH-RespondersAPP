import 'package:flutter/material.dart';
import 'package:responders/constants/color.dart';
import 'package:responders/screens/tabs/interchat.dart';
import 'package:responders/screens/tabs/intrachat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CHATROOM'),
        ),
        body:  Column(
          children: [
            TabBar(tabs: [
              Tab(
                child: Text(
                  'Global Channel',
                  style: TextStyle(
                    color: sihblue,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Agency Channel',
                  style: TextStyle(
                    color: sihblue,
                  ),
                ),
              )
            ]),
            Expanded(
              child: TabBarView(children: [InterChatTab(), IntraChatTab()]),
            )
          ],
        ),
      ),
    );
  }
}
