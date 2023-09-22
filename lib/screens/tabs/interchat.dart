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

class InterChatTab extends StatelessWidget {
  const InterChatTab({Key? key}) : super(key: key);

  final List<ChatCardDetails> cards = const [
    ChatCardDetails(
      title: 'Flood Disaster Kerala XY',
      color: Colors.red,
      avatarUrl: 'https://pbs.twimg.com/profile_images/1560529136569192450/MpU9mVLB_400x400.jpg',
      name: 'NDRF',
      notificationCount: 2,
      time: '2 hours ago',
    ),
    ChatCardDetails(
      title: 'Card 2',
      color: Colors.green,
      avatarUrl: 'https://upload.wikimedia.org/wikipedia/en/7/7d/Sdrf_Assam_logo.png',
      name: 'SDRF',
      notificationCount: 1,
      time: '1 hour ago',
    ),
    ChatCardDetails(
      title: 'Flood Disaster Kerala XY',
      color: Colors.green,
      avatarUrl: 'https://pbs.twimg.com/profile_images/1560529136569192450/MpU9mVLB_400x400.jpg',
      name: 'NDRF',
      notificationCount: 2,
      time: '2 hours ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: searchBox(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
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
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(avatarUrl),
              radius: 40,
            ),
            SizedBox(height: 16.0),
            Text(
              'Emergency Name: $title',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Admin: $name',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Disaster Type: Sample Disaster Type',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Place: Sample Place',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '$notificationCount',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
