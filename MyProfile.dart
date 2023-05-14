import 'package:flutter/material.dart';
import 'Home.dart';
import 'SignUp.dart';
import 'MyNavigationBar.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String _errorMessage = '';

  void _logoutButtonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Logout'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // navigate to login page
                  Navigator.pushReplacementNamed(context, '/');
                },
            ),
          ],
        );
      },
    );
  }

  void _giveFeedbackButtonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Give Feedback'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Type your feedback here...',
            ),
            maxLines: 5,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Send'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color(0xFF008000),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          Icon(
            Icons.person,
            size: 96.0,
            color: Colors.grey,
          ),
          SizedBox(height: 16.0),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 32.0),
          Center(
            child: SizedBox(
              width: 200.0,
              child: ElevatedButton(
                onPressed: _giveFeedbackButtonPressed,
                child: Text('Give Feedback'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 17, 85, 19),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                color: Colors.grey,
              ),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: _logoutButtonPressed,
                icon: Icon(Icons.logout),
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
