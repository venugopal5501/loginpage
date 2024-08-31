import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart'; // Import the WelcomePage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
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
        // Navigate to the new page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      } else {
        // Incorrect username or password
        _showDialog('Incorrect username or password');
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      _showDialog('Incorrect username or password');
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/cars.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 255, 30),
                ),
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
                  const Text(
                    "Let's sign you in",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 255, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8), // Add SizedBox for spacing
                  const Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 30), // Add SizedBox for spacing
                  SizedBox(
                    height: 50,
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
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
                  const SizedBox(height: 30), // Add SizedBox for spacing
                  SizedBox(
                    height: 50,
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
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
                  const SizedBox(height: 30), // Add SizedBox for spacing
                  SizedBox(
                    height: 50,
                    width: 535, // Adjust the width as needed
                    child: ElevatedButton(
                      onPressed: _signInWithEmailAndPassword,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 60,
                        backgroundColor: Colors.white, // Specify a color here
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(233, 30, 30, 1),
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
