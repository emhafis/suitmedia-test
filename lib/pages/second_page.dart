import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_assestment/pages/third_page.dart';

class SecondPage extends StatefulWidget {
  final String selectedUserName;

  const SecondPage({Key? key, required this.selectedUserName}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.selectedUserName,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                result != null ? 'Selected $result' : 'Selected User Name',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                result = await Get.to<String>(ThirdPage());

                // Setelah mendapatkan hasil, perbarui tampilan
                Get.forceAppUpdate();
              },
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
