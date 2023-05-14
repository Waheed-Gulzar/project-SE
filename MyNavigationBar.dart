import 'package:flutter/material.dart';
import 'Home.dart';       //linked with home 
import 'Login.dart';      //linked with login
import 'MyProfile.dart';  //linked with 
class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();     //Constructor
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[   
     Home(), // replace with your home page widget  
       Text('Rating'),    Text('Profile'),    Text('Settings'),Text('Logout'), ];
  
  void _onItemTapped(int index) {             //function to navigate to next pages
    setState(() {
      _selectedIndex = index;
      if (index == 0) {                               // condition to navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 2) {                      // condition to navigate to my profile page
        Navigator.pushReplacementNamed(context, '/profile');
      } else if (index == 4) {                // condition to navigate to logout
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),                //messsage poping up
              content: const Text('Are you sure you want to logout?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, '/');       // route of login is given 
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Vendors'),
        backgroundColor: Colors.green[900],           //setting color
        iconTheme: const IconThemeData(color: Colors.green),      //icon color
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[900],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(            //showing icons in the bottom
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
