import 'package:flutter/material.dart';

class Accident extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Processing',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 2, 26, 240))),
        backgroundColor:
            const Color.fromARGB(255, 255, 85, 59), // Make AppBar transparent
        elevation: 0, // Remove shadow below AppBar
        toolbarHeight: 80, // Increase AppBar height
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ca.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please upload the file',
                style: const TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
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
    home: Accident(),
  ));
}
