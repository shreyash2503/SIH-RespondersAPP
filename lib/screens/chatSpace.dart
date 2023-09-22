import 'package:flutter/material.dart';
import 'package:responders/constants/color.dart';

class ChatSpace extends StatelessWidget {
  const ChatSpace({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageDisplay(), 
          ),
          MessageInput(), 
        ],
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(messages[index]),
          subtitle: Text('12:34 PM'), 
        );
      },
    );
  }
}

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    setState(() {
      messages.add(text);
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _handleSubmitted(_textController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}

List<String> messages = [
  'Its an emergencyy!',
  'Need more resourcess!!!',
  'Got 3 men backup!',
  'I am good, thank you!',
  'Undercontroll!!',
];
