import 'package:api_practice/user_api/usercontroller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User_page extends StatefulWidget {
  const User_page({super.key});

  @override
  State<User_page> createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {

  UserController userController = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    print("-------------------------");
    userController.fetchUserData();
    print("-------------------------");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () {
            // if (userController.isloading.value) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            if (userController.userData.value == null ) {
              const Text("No");
            }
            // Show user data once loaded
            if (userController.userData.value?.users.length != null) {
              return ListView.builder(
                itemCount: userController.userData.value?.users.length,
                itemBuilder: (context, i) {
                  var user = userController.userData.value?.users[i];
                  return Text("${user?.email}");
                },
              );
            }
            // If no data or error, display a placeholder message
            // return Text("No user data available");
            return const Center(
              child: CircularProgressIndicator(),
            );
            // return ListView.builder(
            //   itemCount: userController.userData.value.users?.length,
            //   itemBuilder: (context, i) {
            //     var user = userController.userData.value.users?[i];
            //     return (userController.userData.value.users == null)
            //         ? const Text("No available data..")
            //         : Text("${user?.id}");
            //   },
            // );
          },
        ),
      ),
    );
  }
}
