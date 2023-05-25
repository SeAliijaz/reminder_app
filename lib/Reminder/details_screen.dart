import 'dart:convert';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);
  final String? payload;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Map<String, dynamic> decodedData;

  @override
  void initState() {
    super.initState();
    if (widget.payload != null) {
      try {
        decodedData = jsonDecode(widget.payload!) as Map<String, dynamic>;
      } catch (e) {
        decodedData = {};
      }
    } else {
      decodedData = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          decodedData.isNotEmpty
              ? _buildNotifiedReminderCard()
              : Center(
                  child: Text(
                    "No Reminders Yet!",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildNotifiedReminderCard() {
    final title = decodedData["title"].toString();
    final eventDate = decodedData["eventDate"].toString();
    final eventTime = decodedData["eventTime"].toString();
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.alarm,
              size: 60.0,
            ),
            SizedBox(height: 12.0),
            Text(
              "Your reminder for",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              eventDate,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 8.0),
                Text(
                  eventTime,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
