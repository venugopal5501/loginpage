import 'package:flutter/material.dart';
import 'package:loginpage/Accident.dart';
import 'package:loginpage/Crime.dart';
import 'package:loginpage/Fire_Accident.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI ENABLED CAR PARKING SYSTEM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 225, 22, 22),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(198, 244, 246, 245),
        toolbarHeight: 80,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Are you sure to exit?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/cars.png',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70.0),
                  child: TileWidget(
                    title: ' ',
                    imagePath: 'assets/spaces.png',
                    buttonText: 'Train Model',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: TileWidget(
                    title: ' ',
                    imagePath: 'assets/glass.png',
                    buttonText: 'Video Processing',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: TileWidget(
                    title: ' ',
                    imagePath: 'assets/booking.png',
                    buttonText: 'Book Slot',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String buttonText;

  const TileWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 252, 252),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 250, height: 300),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                switch (buttonText) {
                  case 'Train Model':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Crime()),
                    );
                    break;
                  case 'Video Processing':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Accident()),
                    );
                    break;
                  case 'Book Slot':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FireAccident()),
                    );
                    break;
                  default:
                    break;
                }
              },
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
