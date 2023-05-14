import 'package:flutter/material.dart';
import 'package:rising_rigels/Home.dart';         // connecting to home 
import 'MyNavigationBar.dart';                //connecting to my navigation file
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
                                                  //class defined
class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();      //variables
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  String _errorMessage = '';

  void _registerButtonPressed() {                               //function of register button
  if (_usernameController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _repasswordController.text.isEmpty) {
    setState(() {
      _errorMessage = 'Please fill in all fields.';
    });
  } else if (_passwordController.text != _repasswordController.text) {
    setState(() {
      _errorMessage = 'Passwords do not match.';
    });
  } else if (_passwordController.text.length < 8 ||
      _repasswordController.text.length < 8) {
    setState(() {
      _errorMessage = 'Passwords must be at least 8 characters long.';
    });
  } else {
    // Navigate to the home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyNavigationBar()),       // if all condition met navigates to next page
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                         //title bar
        title: Text('Sign Up'),
        backgroundColor: Color(0xFF008000),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            Text('Re-enter Password'),
            TextField(
              controller: _repasswordController,
              obscureText: true,
            ),
            SizedBox(height: 8.0),
            Text(                               //modification of error message
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                height: 40.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: _registerButtonPressed,
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 22, 80, 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
