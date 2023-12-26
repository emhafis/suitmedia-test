import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  final FirstPageController controller = Get.put(FirstPageController());

  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 24, 145, 206),
              Color.fromARGB(255, 6, 136, 119)
            ], // Adjust the colors as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 70,
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.sentenceController,
                decoration: InputDecoration(
                  labelText: 'Sentence',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.checkPalindrome();
                },
                child: const Text('Check'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.goToSecondScreen();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
