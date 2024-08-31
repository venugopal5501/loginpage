import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future<void> _predict(BuildContext context) async {
  // Add BuildContext parameter
  final response =
      await http.get(Uri.parse('http://localhost:51662/process_image'));
  if (response.statusCode == 200 &&
      response.headers['content-type'] == 'image/png') {
    // Convert the response body to a Uint8List
    Uint8List bytes = response.bodyBytes;
    // Display the image
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.memory(bytes),
        );
      },
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to process image. Please try again later.')));
  }
}

class Crime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crime Detection System',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 2, 240, 10))),
        backgroundColor:
            Color.fromARGB(255, 127, 102, 185), // Make AppBar transparent
        elevation: 0, // Remove shadow below AppBar
        toolbarHeight: 80, // Increase AppBar height
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/qw.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please upload the file',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 186, 6, 6)),
              ),
              SizedBox(
                  height: 20), // Add some space between the text and the button
              ElevatedButton(
                onPressed: () {
                  // Show file upload dialog
                  _showFileUploadDialog(context);
                },
                child: const Text(
                  'Choose File',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(height: 20), // Add some space between the buttons
              ElevatedButton(
                onPressed: () {
                  _predict(context);
                  // Implement the logic for the Predict button here
                },
                child: const Text(
                  'Predict',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFileUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload File'),
          content: Text('Choose a file to upload'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Crime(),
  ));
}
