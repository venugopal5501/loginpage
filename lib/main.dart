import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBv8dYmEyz8NYmvHYNs4JCoabSnkx57zqQ",
      projectId: "auc2-cd5a6",
      messagingSenderId: "177739592657",
      appId: "1:177739592657:web:841efac3f99c823da466f0",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    String username = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      // If the login is successful, userCredential will not be null
      if (userCredential.user != null) {
        _showDialog('Successfully logined');
        // Successful login
      } else {
        // Incorrect username or password
        _showDialog('Incorrect username or password');
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      _showDialog('Incorrect username or password:${e.message}');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Result'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 30, 99, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: Colors.transparent,
              child: Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Let's sign you in",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8), // Add SizedBox for spacing
                  Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30), // Add SizedBox for spacing
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Color.fromRGBO(251, 248, 249, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50), // Add SizedBox for spacing
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Color.fromRGBO(244, 242, 242, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Add SizedBox for spacing
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: _signInWithEmailAndPassword,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background color
                          onPrimary:
                              Color.fromRGBO(233, 30, 99, 1), // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
