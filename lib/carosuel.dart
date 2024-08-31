import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loginpage/main.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carousel Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to login page
                Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Goto Login'),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                 height: 400.0,
                 autoPlay: true,
                 enlargeCenterPage: true,
                 aspectRatio: 2.0,
                 onPageChanged: (index, reason) {
                    // Handle page change
                 },
                ),
                items: [
                 Image.asset('assets/ai.png'), // Replace with your asset path
                 Image.asset('assets/ai.png'), // Replace with your asset path
                 Image.asset('assets/ai.png'), // Replace with your asset path
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }
}


