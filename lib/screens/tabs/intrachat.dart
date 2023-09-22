import 'package:flutter/material.dart';
import 'package:responders/constants/color.dart';

class ChatCardDetails {
  final String title;
  final Color color;
  final String avatarUrl;
  final String name;
  final int notificationCount;
  final String time;

  const ChatCardDetails({
    required this.title,
    required this.color,
    required this.avatarUrl,
    required this.name,
    required this.notificationCount,
    required this.time,
  });
}

class IntraChatTab extends StatelessWidget {
  const IntraChatTab({Key? key}) : super(key: key);

  final List<ChatCardDetails> cards = const [
    ChatCardDetails(
      title: 'Flood Disaster Kerla xy',
      color: Colors.red,
      avatarUrl: 'https://t4.ftcdn.net/jpg/03/20/77/15/360_F_320771526_waXiA8ga1jM62AiGpAaqYFD0MggrwnHj.jpg',
      name: 'Fire Fighters KK',
      notificationCount: 2,
      time: '2 hours ago',
    ),
    ChatCardDetails(
      title: 'Card 2',
      color: Colors.green,
      avatarUrl: 'https://t4.ftcdn.net/jpg/03/20/77/15/360_F_320771526_waXiA8ga1jM62AiGpAaqYFD0MggrwnHj.jpg',
      name: 'Fire Fighters KK',
      notificationCount: 1,
      time: '1 hour ago',
    ),
    ChatCardDetails(
      title: 'Card 3',
      color: Colors.green,
      avatarUrl: 'https://t4.ftcdn.net/jpg/03/20/77/15/360_F_320771526_waXiA8ga1jM62AiGpAaqYFD0MggrwnHj.jpg',
      name: 'Fire Fighters KK',
      notificationCount: 0,
      time: '3 hours ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              searchBox(),
            ],
          ),
          Expanded(
            child: ListView(
              children: cards.map((cardDetails) {
                return buildCard(
                  cardDetails.title,
                  cardDetails.color,
                  cardDetails.avatarUrl,
                  cardDetails.name,
                  cardDetails.notificationCount,
                  cardDetails.time,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Floating button pressed'),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: sihblue,
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              color: sihblack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: sihgrey)),
      ),
    );
  }

  Widget buildCard(
    String title,
    Color color,
    String avatarUrl,
    String name,
    int notificationCount,
    String time,
  ) {
    return Card(
      color: color,
      elevation: 25,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              '$notificationCount',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 8.0),
            Text(
              time,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
