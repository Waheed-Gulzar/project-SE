import 'package:flutter/material.dart';
import 'Home.dart';                         //connected to home page
import 'SignUp.dart';                       //connected to signup page
import 'MyNavigationBar.dart';                //connecting to navigation

class LoginPage extends StatefulWidget {                
  @override
  _LoginPageState createState() => _LoginPageState();
}
                                                    //class defined
class _LoginPageState extends State<LoginPage> {                            
  TextEditingController _usernameController = TextEditingController();      //variables 
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _loginButtonPressed() {                                //function
  String username = _usernameController.text.trim();
  String password = _passwordController.text.trim();

  if (username.isEmpty || password.isEmpty) {
    setState(() {                                               //conditions if the password is empty
      _errorMessage = 'Please enter both username and password.';
    });
  } else if (password.length < 8) {
    setState(() {                                     //if password is less than 8 digits
      _errorMessage = 'Password must be at least 8 characters long.';
    });
  } else {
    Navigator.push(                             //function pushing to the navigation bar
      context,
      MaterialPageRoute(builder: (context) => MyNavigationBar()),
    );
  }
}

                            
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                       //title bar 
        title: Text('Login'),
        backgroundColor: Color(0xFF008000),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),        //algining the text
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text('Username'),
            TextField(
              controller: _usernameController,
            ),
            SizedBox(height: 16.0),
            Text('Password'),
            TextField(
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 32.0),
            Center(
              child: SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: _loginButtonPressed,
                  child: Text('Login'),
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
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage())
                    );
                  },
                  child: Text('SignUp'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
