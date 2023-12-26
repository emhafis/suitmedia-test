import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/third_page_controller.dart';

class ThirdPage extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : (controller.userList.isEmpty
                ? const Center(child: Text('No data available'))
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.userList.clear();
                      await controller.fetchData();
                    },
                    child: ListView.builder(
                      itemCount: controller.userList.length,
                      itemBuilder: (context, index) {
                        var user = controller.userList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(
                            '${user.firstName} ${user.lastName}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(user.email),
                          onTap: () {
                            Get.back(
                                result: "${user.firstName} ${user.lastName}");
                          },
                        );
                      },
                    ),
                  )),
      ),
    );
  }
}
