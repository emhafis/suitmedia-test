import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class UserController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var currentPage = 1;
      var totalUsers = 0;

      do {
        var response = await http.get(
          Uri.parse(
              'https://reqres.in/api/users?page=$currentPage&per_page=10'),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          totalUsers = data['total'];
          var userListData = (data['data'] as List)
              .map((item) => UserModel.fromJson(item))
              .toList();
          userList.addAll(userListData);
        }

        currentPage++;
      } while (userList.length < totalUsers);
    } finally {
      isLoading(false);
    }
  }
}
