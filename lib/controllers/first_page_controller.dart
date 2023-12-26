import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../pages/second_page.dart';

class FirstPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  RxString resultMessage = ''.obs;

  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  void checkPalindrome() {
    String sentence = sentenceController.text;
    bool palindrome = isPalindrome(sentence);
    resultMessage.value = palindrome ? 'Palindrome' : 'Not Palindrome';

    Get.dialog(
      AlertDialog(
        title: const Text('Palindrome Check'),
        content: Obx(() => Text(resultMessage.value)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void goToSecondScreen() {
    Get.to(() => SecondPage(selectedUserName: nameController.text));
  }
}
