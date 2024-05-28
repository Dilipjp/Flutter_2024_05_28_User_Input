import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController userNameInput = TextEditingController();
  TextEditingController passWordInput = TextEditingController();
  String _displayText = '';


  final String _correctUserName = 'dilip';
  final String _correctPassWord = '123';

  void changeText(){
    setState(() {
      _displayText = _controller.text.split('').reversed.join('');
      _displayText = _controller.text + '' + _controller2.text;
    });
  }
  

  void checkUser(){
    setState(() {
      String enteredUserName = userNameInput.text;
      String enteredPassWord = passWordInput.text;

      if (enteredUserName == _correctUserName && enteredPassWord == _correctPassWord) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid Username or Password!'),
            backgroundColor: Colors.red,
          ),
        );
      }



    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField(
            //   controller: _controller,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: "Enter first name"
            //   ),
            // ),
            // SizedBox(height: 10,),
            // TextField(
            //   controller: _controller2,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: "Enter last name"
            //   ),
            // ),
            // SizedBox(height: 10,),
            TextField(
              controller: userNameInput,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Username"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passWordInput,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter password"
              ),
              obscureText: true,
            ),
            // SizedBox(height: 10,),
            // ElevatedButton(onPressed:
            //     changeText,
            //     child: Text('reverse the input')),
            // SizedBox(height: 10,),
            // Text(
            //   _displayText,
            //   style: TextStyle(fontSize: 24),
            // ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed:
            checkUser,
                child: Text('Submit')),
            SizedBox(height: 10,)

          ],
        ),
      ),

    );
  }
}



